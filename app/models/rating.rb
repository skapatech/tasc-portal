class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider

  validates :rating, presence: true
end
