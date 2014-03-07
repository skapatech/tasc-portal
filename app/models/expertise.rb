class Expertise < ActiveRecord::Base
  belongs_to :provider
  belongs_to :subject

  validates :subject, presence: true
  validates :provider, presence: true
  validates :experience, presence: true, :numericality => {:greater_than => 0}
end
