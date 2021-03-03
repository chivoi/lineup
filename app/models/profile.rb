class Profile < ApplicationRecord
  belongs_to :musictype
  belongs_to :user
end
