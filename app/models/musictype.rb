class Musictype < ApplicationRecord
  has_one :gig
  has_one :profile
end
