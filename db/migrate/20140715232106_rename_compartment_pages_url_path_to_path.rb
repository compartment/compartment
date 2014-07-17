class RenameCompartmentPagesUrlPathToPath < ActiveRecord::Migration
  def change
    rename_column :compartment_pages, :url_path, :path
  end
end
