class CreateCompartmentSites < ActiveRecord::Migration
  def change
    create_table :compartment_sites do |t|
      t.string :domain

      t.timestamps
    end
  end
end
