class CreatePeriodDetails < ActiveRecord::Migration
  def self.up
    create_table :period_details do |t|
      t.integer :schedulling_period_id
      t.integer :period
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :period_details
  end
end
