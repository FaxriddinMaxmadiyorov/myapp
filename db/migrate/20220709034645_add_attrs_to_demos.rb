class AddAttrsToDemos < ActiveRecord::Migration[6.1]
  def change
    add_column :demos, :name, :string
    add_column :demos, :description, :string
  end
end
