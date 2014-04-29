class Speak < ActiveRecord::Base
  belongs_to :language
  belongs_to :provider


end
