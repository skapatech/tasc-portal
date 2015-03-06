log = File.open("output.txt", 'w')
ReResume.where("ResumeID in (41,42,186,188,253,276,309,318,366,372,391,393,394,405,406,450,457,458,463,465,480,498,568,570)").each do |r|
  puts r.ResumeID
  r.Zip = r.Zip[0,5]

  begin
    provider = Provider.new(resume_id: r.ResumeID, first_name: r.FirstName, last_name: r.LastName, middle_initial: r.MI, email: r.Email,
    phone: r.Phone, cell: r.CellPhone, address1: r.Address1, address2: r.Address2,
    city: (r.Zip.length==0 ? nil : r.Zip.to_region(:city=>true)),
    state: (r.Zip.length==0 ? nil : r.Zip.to_region(:state=>true)),
    zip: r.Zip, rate: r.HourlyRate,
    position: r.JobTitle, organization: r.Organization, years_experience: r.ExperienceLevel.to_i, resume: r.ResumeText)

    r.re_my_expertises.where('ExperienceLevel>12').each do |ex|
      subject = Subject.joins(:subject_area).where('subjects.name=? and subject_areas.name=?', ex.ExpertiseName, ex.ExpertiseSubCategory).first
      if (subject.nil?)
        puts "Missing subject: id #{ex.MyExpertiseID} #{ex.ExpertiseName}, #{ex.ExpertiseSubCategory}\n"
        log.write("Missing subject: id #{ex.MyExpertiseID} #{ex.ExpertiseName}, #{ex.ExpertiseSubCategory}\n")
        next
      end

      if (!ex.ExpertiseComment.nil? && ex.ExpertiseComment.length>255) then
        ex.ExpertiseComment = ex.ExpertiseComment[0,255]
      end
      provider.expertises << Expertise.new(subject: subject, experience: ex.ExperienceLevel.to_i-13, comment: ex.ExpertiseComment)
    end

    {r.EducationLevelID => r.Major1, r.EducationLevel2ID => r.Major2, r.EducationLevel3ID => r.Major3}.each do |id, major|
      next if (id.to_i < 6 || major.nil? || major.length == 0)
      provider.educations << Education.new(degree_id: id.to_i-6, major: major)
    end

    if (provider.valid?)
      provider.save
    else
      puts "Validation error on #{r.ResumeID}: #{provider.errors.full_messages}\n"
      log.write("Validation error on #{r.ResumeID}: #{provider.errors.full_messages}")
    end
  rescue StandardError => ex
    log.write(ex.message+"\n")
    log.write(ex.backtrace.join("\n"))
    log.write("\n")
    log.write("ZIP: " + r.Zip)
    log.write("\n")
  end

end
log.close
