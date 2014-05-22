class Subject < ActiveRecord::Base
  has_many :expertises, inverse_of: :subjects
  has_many :providers, through: :expertises
  belongs_to :subject_area

  validates :subject_area, presence: true
  validates :name, presence: true

  def full_name
    subject_area.name + ' - ' + name
  end
end
