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
  before_validation :default_values
	belongs_to :list , inverse_of: :items
	has_many :comments, inverse_of: :item ,autosave: :true, dependent: :destroy
	validates_presence_of :title, :priority
	validates :title, uniqueness: { scope: :list}
	validates :priority, uniqueness: { scope: :list}
	default_scope { order("priority ASC") }
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def default_values
      if self.description.nil? || self.description=='' 
        self.description = 'No description available' 
      end
  end

end
