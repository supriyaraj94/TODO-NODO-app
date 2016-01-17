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
	belongs_to :list
end
