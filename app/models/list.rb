# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  status      :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class List < ActiveRecord::Base
  has_many :items, inverse_of: :list ,autosave: :true, dependent: :destroy
  belongs_to :user
  validates_presence_of :title
  validates :title, uniqueness: { scope: :user}

  def self.as_csv
    CSV.generate do |csv|
      csv << column_names +  Item.column_names
      all.each do |list|
        list.items.each do |item|
          csv << list.attributes.values_at(*column_names) +  item.attributes.values_at(*Item.column_names)
        end
      end
    end
  end




end


