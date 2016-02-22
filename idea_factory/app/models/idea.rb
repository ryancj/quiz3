class Idea < ActiveRecord::Base

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :groups, dependent: :destroy
  has_many :users, through: :groups

  validates :title, presence: true
  validates :description, presence: true

  def user_full_name
    user.full_name if user
  end

  def like_for(user)
    likes.find_by_user_id user
  end

  def group_for(user)
    groups.find_by_user_id user
  end
end
