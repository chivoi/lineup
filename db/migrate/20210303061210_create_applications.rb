class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.references :gig, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
