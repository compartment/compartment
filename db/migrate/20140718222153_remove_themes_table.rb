class RemoveThemesTable < ActiveRecord::Migration
  def change
    add_column :compartment_sites, :theme, :string
  end
end
