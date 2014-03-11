class Education < ActiveRecord::Base
  validates :provider_id, presence: true
  validates :degree_id, presence: true
  validates :major, presence: true
end
