class CommunityCategory < ActiveRecord::Base
  belongs_to :community
  belongs_to :category
end
