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

end
