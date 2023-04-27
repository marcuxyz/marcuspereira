class Post < ApplicationRecord
  belongs_to :user

  validates :title, :content, :position, presence: true
end
