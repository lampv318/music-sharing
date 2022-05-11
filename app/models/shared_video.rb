class SharedVideo < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :url, presence: true
end
