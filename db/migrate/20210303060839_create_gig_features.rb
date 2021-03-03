class CreateGigFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :gig_features do |t|
      t.references :gig, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
