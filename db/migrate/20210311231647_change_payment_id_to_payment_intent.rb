class ChangePaymentIdToPaymentIntent < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :donations, :payment_id, :payment_intent
  end

  def self.down
    rename_column :donations, :payment_intent, :payment_id
  end
end
