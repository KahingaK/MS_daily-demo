class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :article

  validates :user, :category, :article, presence: true
end
