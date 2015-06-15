class City < ActiveRecord::Base
  self.table_name = 'cities'
  self.primary_key = 'id'

  #关联表结构:
  #provinces(id,....)
  #cities(id,province_id,...)
  #areas(id,city_id,...)
  belongs_to :province, class_name: 'Province', foreign_key: :province_id
  has_many :areas, class_name: 'Area', foreign_key: :city_id

  default_scope -> { order(id: :asc)}
end