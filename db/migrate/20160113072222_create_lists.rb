class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :user, index:true
      # FIXME: Add DB null and default constraints
      t.string :title
      t.string :status
      t.text :description
      t.timestamps null: false
    end
  end
end
