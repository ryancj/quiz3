class Comment < ActiveRecord::Base
  belongs_to :idea

  validates :comment, presence: true
end
