class Post < ApplicationRecord
  belongs_to :user
  has_many   :resources, dependent: :destroy

  validates :title, :content, :position, presence: true
end
