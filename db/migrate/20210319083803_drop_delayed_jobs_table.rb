class DropDelayedJobsTable < ActiveRecord::Migration[6.1]
  def self.up
    drop_table :delayed_jobs
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
