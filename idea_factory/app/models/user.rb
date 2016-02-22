class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas, dependent: :nullify

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
