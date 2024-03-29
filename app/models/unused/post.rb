class Post < ApplicationRecord

  belongs_to :community
  belongs_to :user

  validates :body, presence: true, length: {minimum: 1, maximum: 2000}
end
