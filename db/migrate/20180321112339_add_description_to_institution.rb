class AddDescriptionToInstitution < ActiveRecord::Migration[5.1]
  def change
    add_column :institutions, :description, :string
  end
end
