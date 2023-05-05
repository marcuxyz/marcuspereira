class Participant < ApplicationRecord
  validates :name, :email, presence: true
end
