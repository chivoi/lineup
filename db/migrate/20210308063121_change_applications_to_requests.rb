class ChangeApplicationsToRequests < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :applications, :requests
  end

  def self.down
    rename_table :requests, :applications
  end
end
