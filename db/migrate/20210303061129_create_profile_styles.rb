class CreateProfileStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_styles do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
