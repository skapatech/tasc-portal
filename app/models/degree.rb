class Degree < ActiveRecord::Base
  has_many :educations, inverse_of: :degree
  has_many :providers, through: :educations
  validates :name, presence: true
end
