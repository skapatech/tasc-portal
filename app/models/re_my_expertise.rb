class ReMyExpertise < ActiveRecord::Base
  establish_connection :reinvent
  self.table_name = 'JobsDb_MyExpertises'
  self.primary_key = 'MyExpertiseID'
  belongs_to :re_experience_level, :foreign_key => 'ExperienceLevel'
  belongs_to :re_resume, :foreign_key => 'ResumeID'
end
