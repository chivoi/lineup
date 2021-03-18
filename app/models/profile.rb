class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :musictype
  has_many :profile_styles, dependent: :destroy
  has_many :styles, through: :profile_styles
  accepts_nested_attributes_for :profile_styles
  has_many_attached :image

  validates :name, presence: true

  before_save :remove_whitespace

  # search by location
  
  def self.search(search)
    if search
      profile = Profile.find_by(location: search)
      if profile
        self.where(profile_id: profile)
      else
        Profile.all
      end
    else 
      Profile.all
    end
  end

  private

  def remove_whitespace
    self.name = self.name.strip.downcase
    self.playtime = self.playtime.strip
    self.demolinks = self.demolinks.strip
    self.location = self.location.strip.downcase
    self.bio = self.bio.strip
  end

end
