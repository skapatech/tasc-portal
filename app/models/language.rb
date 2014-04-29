class Language < ActiveRecord::Base
  has_many :providers, through: :speaks
  validates :name, presence: true

  def to_s
    name
  end
end
