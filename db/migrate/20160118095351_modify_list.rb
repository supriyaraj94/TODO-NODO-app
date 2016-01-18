class ModifyList < ActiveRecord::Migration
  def change
    change_column :lists, :title, :string ,null:false
    change_column :lists, :description, :text, default:'No description available' 	
  end
end
