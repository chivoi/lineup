class Musictype < ApplicationRecord
  has_one :gig
  has_many :profiles
end
