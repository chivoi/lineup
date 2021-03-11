class AddAmountToDonations < ActiveRecord::Migration[6.1]
  def change
    add_column :donations, :amount, :money, scale: 2
  end
end
