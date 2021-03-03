class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.date :date
      t.time :time
      t.string :venue
      t.string :location
      t.text :description
      t.references :musictype, null: false, foreign_key: true
      t.integer :set_length
      t.money :tickets_presale
      t.money :door_charge
      t.integer :payment
      t.boolean :filled
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
