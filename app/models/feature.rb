class Feature < ApplicationRecord
  has_many :gig_features
  has_many :gigs, through: :gig_features
end
