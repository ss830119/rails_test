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

  def self.search params = {}
    params = params.symbolize_keys
    @self = self
    
    if params[:daterange].present?
      @start_at = params[:daterange].split("-")[0].to_date.beginning_of_day
      @end_at = params[:daterange].split("-")[1].to_date.end_of_day
      @self = @self.between_times(@start_at, @end_at)
    end

    return @self
  end

  def self.xlsx_columns
    self.column_names - ["created_at", "updated_at", "deleted_at"]
  end

  def self.xlsx_row
    @xlsx_columns = xlsx_columns.map{|i| self.human_attribute_name(i)}
 
    return @xlsx_columns
  end

  def xlsx_row
    @xlsx_columns = self.class.xlsx_columns.map{|i| i.gsub("_id", "\&\.name")}.map{|i| instance_eval(i)}

    return @xlsx_columns
  end


end
