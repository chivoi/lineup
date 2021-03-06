class Profile < ApplicationRecord
  belongs_to :musictype
  belongs_to :user
  has_many :profile_styles, dependent: :destroy
  has_many :styles, through: :profile_styles
  accepts_nested_attributes_for :profile_styles

  before_save :remove_whitespace

  private

  def remove_whitespace
    self.name = self.name.strip
    self.playtime = self.playtime.strip
    self.demolinks = self.demolinks.strip
    self.location = self.location.strip
    self.bio = self.bio.strip
  end



end
