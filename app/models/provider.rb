class Provider < ActiveRecord::Base
  has_many :expertises
  has_many :subjects, through: :expertises

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address1, presence: true
  validates :zip, presence: true
  validates :position, presence: true
  validates :organization, presence: true
  validates :resume, presence: true
  validates :rate, presence: true, :numericality => {:greater_than => 0}
  #validate :must_have_an_expertise


  private
  def must_have_an_expertise
    if expertises.nil? || expertises.size < 1
      errors.add(:expertises, :too_short, :count => 1)
    end
  end
end
