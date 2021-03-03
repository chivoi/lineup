class Gig < ApplicationRecord
  belongs_to :musictype
  belongs_to :user_id
end
