class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :user, index:true
      t.string :title
      t.string :status
      t.text :description
      t.timestamps null: false
    end
  end
end
