# class ReResume < ActiveRecord::Base
#   establish_connection :reinvent
#   self.table_name = 'JobsDb_Resumes'
#   self.primary_key = 'ResumeID'
#
#   belongs_to :re_education_level, :foreign_key => 'EducationLevelID'
#   belongs_to :re_education_level2, :foreign_key => 'EducationLevelID2'
#   belongs_to :re_education_level3, :foreign_key => 'EducationLevelID3'
#   belongs_to :re_experience_level, :foreign_key => 'ExperienceLevel'
#   has_many :re_my_expertises, :foreign_key => 'ResumeID'
# end
