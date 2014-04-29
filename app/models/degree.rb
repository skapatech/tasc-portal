class Degree < ActiveRecord::Base
  has_many :educations
  has_many :providers, through: :educations
  validates :name, presence: true
end
