class Comment < ActiveRecord::Base
	belongs_to :item , inverse_of: :comments
	validates_presence_of :text
	#default_scope { order("timestamps ASC") }
end
