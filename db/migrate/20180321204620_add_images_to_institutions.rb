class AddImagesToInstitutions < ActiveRecord::Migration[5.1]
  def change
    add_column :institutions, :images, :string
  end
end
