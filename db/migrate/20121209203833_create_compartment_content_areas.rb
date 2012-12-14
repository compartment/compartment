class CreateCompartmentContentAreas < ActiveRecord::Migration
  def change
    create_table :compartment_content_areas do |t|
      t.references :page
      t.string :name

      t.timestamps
    end
    add_index :compartment_content_areas, :page_id
  end
end
