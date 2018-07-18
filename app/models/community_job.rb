class CommunityJob < ActiveRecord::Base
  belongs_to :community
  belongs_to :job
end
