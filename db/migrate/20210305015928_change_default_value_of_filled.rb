class ChangeDefaultValueOfFilled < ActiveRecord::Migration[6.1]
  def change
    change_column :gigs, :filled, :boolean, default: false
  end
end
