class Idea < ApplicationRecord
  acts_as_votable

  belongs_to :user


  validates :title, presence: true, length: {minimum: 1, maximum: 160}
  validates :link, presence: true

end
