class AddDefaultValueToFilled < ActiveRecord::Migration[6.1]
  def change
    change_column_default :gigs, :filled, default: false
  end
end
