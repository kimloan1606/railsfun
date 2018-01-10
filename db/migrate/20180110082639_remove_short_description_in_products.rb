class RemoveShortDescriptionInProducts < ActiveRecord::Migration[5.1]
  def change
  	remove_column :products, :shorts_description, :string
  end
end
