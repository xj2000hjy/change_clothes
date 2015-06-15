class Area < ActiveRecord::Base
  self.table_name = 'areas'
  self.primary_key = 'id'

  #关联表结构:
  #cities(id,province_id,...)
  #areas(id,city_id,...)
  belongs_to :city, class_name: 'City', foreign_key: :city_id

  default_scope lambda { order('id DESC') }
end