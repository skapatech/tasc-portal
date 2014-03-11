class Degree < ActiveRecord::Base
  validates :name, presence: true
end
