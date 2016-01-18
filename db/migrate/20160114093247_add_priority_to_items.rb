class AddPriorityToItems < ActiveRecord::Migration
  def change
  	add_column :items, :priority, :decimal
  end
end
