class CreateMusictypes < ActiveRecord::Migration[6.1]
  def change
    create_table :musictypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
