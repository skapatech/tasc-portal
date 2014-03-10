class Speaks < ActiveRecord::Base
  validates :provider_id, presence: true
  validates :language_id, presence: true
end
