class ChangeProfilesPlaytimeType < ActiveRecord::Migration[6.1]
  def self.up
    change_table :profiles do |t|
      t.change :playtime, :string
    end
  end
  def self.down
    change_table :profiles do |t|
      t.change :playtime, :int4range
    end
  end
end
