class User < ApplicationRecord
  before_create { set_api_key }

  has_secure_password

  validates :email, presence: true, uniqueness: true

  def set_api_key
    begin
      self[:api_key] = generate_api_key
    end while User.exists?(:api_key => self[:api_key])
  end

  def generate_api_key
    SecureRandom.hex(24)
  end
end
