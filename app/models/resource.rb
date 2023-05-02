class Resource < ApplicationRecord
  belongs_to :post

  validates :name, :url, presence: true
  validates :name, :url, uniqueness: true
end
