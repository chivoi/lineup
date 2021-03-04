class ChangeGigsTimeType < ActiveRecord::Migration[6.1]
  def self.up
    change_table :gigs do |t|
      t.change :time, :string
    end
  end
  def self.down
    change_table :gigs do |t|
      t.change :time, :time
    end
  end
end
