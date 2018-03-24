class AddTextToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :text, :string
  end
end
