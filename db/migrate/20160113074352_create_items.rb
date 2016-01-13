class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :list, index:true
      t.string :title
      t.text :description
      t.timestamps null: false
    end
  end
end
