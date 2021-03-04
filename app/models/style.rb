class Style < ApplicationRecord
  has_many :gig_styles
  has_many :styles, through: :gig_styles
end
