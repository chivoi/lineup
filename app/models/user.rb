class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gigs
  has_one :profile
  accepts_nested_attributes_for :profile
  has_many :requests, dependent: :destroy

  def with_profile
    build_profile if profile.nil?
    self
  end

  def received_requests
    Request.where(host_id: self.id)
  end
  
end
