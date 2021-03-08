class ChangeProfileToUserInRequests < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :requests, :profile_id
    add_reference :requests, :user, index: true
  end

  def self.down
    remove_column :requests, :user_id
    add_reference :requests, :profile, index: true
  end
end
