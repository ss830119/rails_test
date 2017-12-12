# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  item_type  :string
#  item_id    :integer
#  file       :string
#  priority   :integer          default(0)
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
