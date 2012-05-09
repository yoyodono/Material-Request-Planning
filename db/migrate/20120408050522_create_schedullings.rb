class CreateSchedullings < ActiveRecord::Migration
  def self.up
    create_table :schedullings do |t|
      t.integer :bom_id
      t.integer :item_id
      t.integer :periode
      t.string :tipe

      t.timestamps
    end
  end

  def self.down
    drop_table :schedullings
  end
end
