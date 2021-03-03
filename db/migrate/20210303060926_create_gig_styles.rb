class CreateGigStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :gig_styles do |t|
      t.references :gig, null: false, foreign_key: true
      t.references :style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
