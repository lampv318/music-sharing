class SharedVideo < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :link, presence: true
  validates :name, presence: true
end
