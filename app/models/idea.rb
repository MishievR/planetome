class Idea < ApplicationRecord

  validates :title, presence: true, length: {minimum: 1, maximum: 160}
end
