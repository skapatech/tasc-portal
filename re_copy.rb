log = File.open("output.txt", 'w')
ReResume.all.each do |r|
  r.Zip = r.Zip[0,5]

  begin
    provider = Provider.new(resume_id: r.ResumeID, first_name: r.FirstName, last_name: r.LastName, middle_initial: r.MI, email: r.Email,
    phone: r.Phone, cell: r.CellPhone, address1: r.Address1, address2: r.Address2,
    city: (r.Zip.length==0 ? nil : r.Zip.to_region(:city=>true)),
    state: (r.Zip.length==0 ? nil : r.Zip.to_region(:state=>true)),
    zip: r.Zip, rate: r.HourlyRate,
    position: r.JobTitle, organization: r.Organization, years_experience: r.ExperienceLevel.to_i, resume: r.ResumeText)

    r.re_my_expertises.where('ExperienceLevel>13').each do |ex|
      subject = Subject.joins(:subject_area).where('subjects.name=? and subject_areas.name=?', ex.ExpertiseName, ex.ExpertiseSubCategory).first
      if (!ex.ExpertiseComment.nil? && ex.ExpertiseComment.length>255) then
        ex.ExpertiseComment = ex.ExpertiseComment[0,255]
      end
      provider.expertises << Expertise.new(subject: subject, experience: ex.ExperienceLevel.to_i-13, comment: ex.ExpertiseComment)
    end

    {r.EducationLevelID => r.Major1, r.EducationLevel2ID => r.Major2, r.EducationLevel3ID => r.Major3}.each do |id, major|
      next if id.to_i < 6
      provider.educations << Education.new(degree_id: id.to_i-3, major: major)
    end

    provider.save
  rescue StandardError => e
    log.write(e)
    log.write("\n")
    log.write(r.Zip)
    log.write("\n")
  end

end
log.close
