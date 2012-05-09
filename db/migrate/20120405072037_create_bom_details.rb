class CreateBomDetails < ActiveRecord::Migration
  def self.up
    create_table :bom_details do |t|
      t.integer :bom_id
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :bom_details
  end
end
