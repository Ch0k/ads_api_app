class User < ApplicationRecord
  NAME_FORMAT = %r{\A\w+\z}

  has_many :ads
  has_many :sessions, class_name: 'UserSession', dependent: :delete_all

  validates :name, :email, presence: true
  validates :name, format: { with: NAME_FORMAT }

  has_secure_password
end

