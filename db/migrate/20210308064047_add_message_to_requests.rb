class AddMessageToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :message, :string
  end  
end