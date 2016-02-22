class Idea < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  def user_full_name
    user.full_name if user
  end
end
