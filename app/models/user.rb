class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable
  has_many :ratings
  validates :name, presence: true
  after_create :set_employee


  private
  def set_employee
    if self.email.include? "skeo.com"
      self.employee = true
      self.save
    end
  end
end
