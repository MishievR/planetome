class Idea < ApplicationRecord
  acts_as_votable


  
  validates :title, presence: true, length: {minimum: 1, maximum: 160}
end
