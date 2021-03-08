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

  validates :date, inclusion: {in: (Date.today..Date.today+5.years)}
  
  before_save :remove_whitespace

  private

  def remove_whitespace
    self.time = self.time.strip
    self.description = self.description.strip
    self.venue = self.venue.strip
    self.location = self.location.strip
  end

end
