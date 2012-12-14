class CreateCompartmentThemes < ActiveRecord::Migration
  def change
    create_table :compartment_themes do |t|
      t.references :site
      t.string :name

      t.timestamps
    end
    add_index :compartment_themes, :site_id
  end
end
