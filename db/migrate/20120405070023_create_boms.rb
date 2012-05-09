class CreateBoms < ActiveRecord::Migration
  def self.up
    create_table :boms do |t|
      t.string :name
      t.integer :item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :boms
  end
end
