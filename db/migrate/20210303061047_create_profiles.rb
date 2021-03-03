class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.int4range :playtime
      t.references :musictype, null: false, foreign_key: true
      t.text :demolinks
      t.string :location
      t.boolean :teamups
      t.text :bio
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
