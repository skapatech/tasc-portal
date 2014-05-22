class Education < ActiveRecord::Base
  belongs_to :provider, inverse_of: :educations, dependent: :destroy
  belongs_to :degree, inverse_of: :educations, dependent: :destroy

  validates :provider, presence: true
  validates :degree, presence: true
  validates :major, presence: true
end
