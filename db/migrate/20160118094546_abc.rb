class Abc < ActiveRecord::Migration
  def change
    change_column :items, :priority, :integer, null:false
    change_column :items, :title, :string ,null:false
    change_column :items, :description, :text, default:'No description available'
  end
end
