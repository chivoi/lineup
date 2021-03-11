class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.string :email
      t.string :name
      t.string :payment_id
      t.string :receipt_url

      t.timestamps
    end
  end
end
