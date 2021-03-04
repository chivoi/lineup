class Profile < ApplicationRecord
  belongs_to :musictype
  belongs_to :user
  has_many :profile_styles, dependent: :destroy
  has_many :styles, through: :profile_styles
  accepts_nested_attributes_for :profile_styles
end
