class AddDetailsToData < ActiveRecord::Migration
  def change
    add_column :data, :title, :string
    add_column :data, :quantity, :string
    add_column :data, :condition, :string
    add_column :data, :description, :text
  end
end
