class Education < ActiveRecord::Base
  belongs_to :provider
  belongs_to :degree
  
  validates :provider_id, presence: true
  validates :degree_id, presence: true
  validates :major, presence: true
end
