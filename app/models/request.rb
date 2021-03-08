class Request < ApplicationRecord
  belongs_to :gig
  belongs_to :profile
  enum status: {pending: 0, accepted: 1, declined: 2}
end
