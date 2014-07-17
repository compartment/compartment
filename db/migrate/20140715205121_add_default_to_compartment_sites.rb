class AddDefaultToCompartmentSites < ActiveRecord::Migration
  def change
    add_column :compartment_sites, :default, :boolean, default: false
  end
end
