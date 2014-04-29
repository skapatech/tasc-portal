class Provider < ActiveRecord::Base
  has_many :expertises
  has_many :subjects, through: :expertises
  has_many :speaks
  has_many :languages, through: :speaks

  has_many :educations
  has_many :degrees, through: :educations
  has_many :ratings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address1, presence: true
  validates :zip, presence: true
  validates :position, presence: true
  validates :organization, presence: true
  validates :resume, presence: true
  validates :rate, :numericality => {:greater_than => 0}
  validates :email, uniqueness: true
  #validate :must_have_an_expertise

  accepts_nested_attributes_for :expertises, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :educations, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :ratings, :reject_if => :all_blank, :allow_destroy => true

  private
  def must_have_an_expertise
    if expertises.nil? || expertises.size < 1
      errors.add(:expertises, :too_short, :count => 1)
    end
  end
end
