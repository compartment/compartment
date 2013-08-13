class CreateCompartmentContentBlocks < ActiveRecord::Migration
  def change
    create_table :compartment_content_blocks do |t|
      t.references :page
      t.text :content_area
      t.text :data

      t.timestamps
    end
    add_index :compartment_content_blocks, :page_id
  end
end
