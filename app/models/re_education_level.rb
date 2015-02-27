class ReEducationLevel < ActiveRecord::Base
  establish_connection :reinvent
  self.table_name = 'JobsDb_EducationLevels'
  self.primary_key = 'EducationLevelID'
end
