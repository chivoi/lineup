class Style < ApplicationRecord
  has_many :gig_styles
  has_many :gigs, through: :gig_styles
end
