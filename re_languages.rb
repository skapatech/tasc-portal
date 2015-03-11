ReResume.all.each do |r|
  p = Provider.find_by_resume_id r.ResumeID

  {"Spanish"=>"Spanish", "Portuguese"=>"Portuguese", "Navajo"=>"Navajo", "OthNatAm"=>"Other Native American", "Vietnamese"=>"Vietnamese", "Chinese"=>"Chinese", "Japanese"=>"Japanese"}.each do |re,wf|
      if (r.send re) then
        puts p.id.to_s + " " + wf
        p.languages << Language.find_by_name(wf)
      end
    end

    p.save
end
