class Gig < ApplicationRecord
  belongs_to :musictype
  belongs_to :user
  enum payment: {fixed: 0, percentage: 1, rider: 2}
  has_many :gig_features, dependent: :destroy
  has_many :features, through: :gig_features
  accepts_nested_attributes_for :gig_features
  has_many :gig_styles, dependent: :destroy
  has_many :styles, through: :gig_styles
  accepts_nested_attributes_for :gig_styles
end
