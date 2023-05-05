class Participant < ApplicationRecord
  validates :name, :email, presence: true

  enum status: { pending: 0, accept: 2, sent: 4 }
end
