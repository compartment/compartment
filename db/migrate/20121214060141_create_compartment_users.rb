class CreateCompartmentUsers < ActiveRecord::Migration
  def change
    create_table :compartment_users do |t|
      t.string :email
      t.string :password_digest
      t.references :site
      t.timestamps
    end
  end
end
