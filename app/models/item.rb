# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  list_id     :integer
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  priority    :decimal(, )
#

# TODO: Add model level validations
class Item < ActiveRecord::Base
	belongs_to :list , inverse_of: :items
	has_many :comments, inverse_of: :item ,autosave: :true, dependent: :destroy
	validates_presence_of :title, :priority
	validates :title, uniqueness: { scope: :list}
	validates :priority, uniqueness: { scope: :list}
	default_scope { order("priority ASC") }

 def as_xls(options = {})
    {
      "title" => title,
    }
 end



end
