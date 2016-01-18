class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :list, index:true
      # COMMENT: Add DB null and default constaints
      t.string :title
      t.text :description
      t.timestamps null: false
    end
  end
end
