class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  acts_as_paranoid

  scope :order_by_priority_desc,-> {order(priority: :desc)}
  scope :order_by_priority_asc,-> {order(priority: :asc)}

  scope :order_by_created_at_desc,-> {order(created_at: :desc)}
  scope :order_by_status_desc,-> {order(status: :desc)}
  scope :order_by_status_asc,-> {order(status: :asc)}


  scope :without_deleted,->  {where(deleted_at: nil)}

  def params_key
    self.class.to_s.singularize.underscore 
  end

  def self.search

  end

end
