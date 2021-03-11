class AddHostIdToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :host_id, :integer
  end
end
