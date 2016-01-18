class AddPriorityToItems < ActiveRecord::Migration
  def change
    # COMMENT: priority column should just be a integer
  	add_column :items, :priority, :decimal
  end
end
