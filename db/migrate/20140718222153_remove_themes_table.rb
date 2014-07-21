class RemoveThemesTable < ActiveRecord::Migration
  def change
    drop_table :compartment_themes
    add_column :compartment_sites, :theme, :string, default: 'default'
  end
end
