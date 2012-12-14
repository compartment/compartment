class CreateCompartmentContentBlocks < ActiveRecord::Migration
  def change
    create_table :compartment_content_blocks do |t|
      t.references :content_area
      t.text :data

      t.timestamps
    end
  end
end
