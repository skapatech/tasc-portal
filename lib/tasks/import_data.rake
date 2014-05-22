require 'csv'

namespace :import_data do
  desc "Import list of expertise subjects"
  task :expertises, [:file_name] => :environment do |t, args|
    parsed_file = CSV.read(args[:file_name], { :col_sep => "\t" })
    parsed_file.shift

    parsed_file.each do |row|
      sa = SubjectArea.find_or_create_by_name row[3]
      Subject.create name:row[4], subject_area: sa
    end
  end

  desc "Create default languages"
  task languages: :environment do
    ['Spanish', 'Portuguese', 'Navajo', 'Other Native American', 'Vietnamese', 'Chinese', 'Japanese'].each do |lang|
      Language.create name: lang
    end
  end

  desc "Create default degrees"
  task degrees: :environment do
    ['Associates','Bachelors', 'Masters', 'Doctorate'].each do |deg|
      Degree.create name: deg
    end
  end

end
