class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :item, index:true
      t.text :text ,null:false
      t.timestamps null: false
    end
  end
end
