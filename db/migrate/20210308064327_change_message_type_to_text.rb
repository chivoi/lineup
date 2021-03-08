class ChangeMessageTypeToText < ActiveRecord::Migration[6.1]
  def self.up
    change_column :requests, :message, :text
  end

  def self.down
    change_column :requests, :message, :string
  end
end
