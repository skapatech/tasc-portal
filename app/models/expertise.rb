class Expertise < ActiveRecord::Base
  belongs_to :provider, inverse_of: :expertises, dependent: :destroy
  belongs_to :subject, inverse_of: :expertises, dependent: :destroy

  validates :subject, presence: true
  validates :provider, presence: true
  validates :experience, presence: true#, :numericality => {:greater_than => 0}

  @EXPERIENCE = {0=>"<1 year", 1=> "1 year", 2=> "2-5 years", 3=> ">5 years"}
  class << self; attr_accessor :EXPERIENCE end
end
