class RemoveTitleFromDemos < ActiveRecord::Migration[6.1]
  def change
    remove_column :demos, :title, :string
  end
end
