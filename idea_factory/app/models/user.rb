class User < ActiveRecord::Base
  has_secure_password

  belongs_to :idea

  has_many :likes, dependent: :destroy
  has_many :ideas, through: :likes

  has_many :groups, dependent: :destroy
  has_many :grouped_ideas, through: :groups, source: :idea

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
