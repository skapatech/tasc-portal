class Subject < ActiveRecord::Base
  has_many :expertises
  has_many :providers, through: :expertises
  belongs_to :subject_area
end
