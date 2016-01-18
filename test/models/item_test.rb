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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
