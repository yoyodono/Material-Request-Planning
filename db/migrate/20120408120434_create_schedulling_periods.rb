class CreateSchedullingPeriods < ActiveRecord::Migration
  def self.up
    create_table :schedulling_periods do |t|
      t.integer :schedulling_id
      t.string :tipe_column

      t.timestamps
    end
  end

  def self.down
    drop_table :schedulling_periods
  end
end
