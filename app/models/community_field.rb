class CommunityField < ActiveRecord::Base
  belongs_to :community
  belongs_to :field
end
