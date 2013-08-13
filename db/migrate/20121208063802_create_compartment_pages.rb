class CreateCompartmentPages < ActiveRecord::Migration
  def change
    create_table :compartment_pages do |t|
      t.references :site
      t.string :url_path
      t.string :title
      t.string :template

      t.timestamps
    end
    add_index :compartment_pages, :site_id
  end
end
