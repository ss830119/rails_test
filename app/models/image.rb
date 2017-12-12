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

class Image < ApplicationRecord
end
