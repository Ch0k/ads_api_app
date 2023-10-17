class UserSession < ApplicationRecord
  before_validation :set_uuid, on: :create
  
  belongs_to :user

  validates :uuid, presence: true

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
