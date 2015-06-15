class Province < ActiveRecord::Base
  self.primary_key = 'id'
  self.table_name = 'provinces'

  #关联表结构:
  #provinces(id,....)
  #cities(id,province_id,...)
  #areas(id,city_id,...)
  has_many :cities, foreign_key: :province_id
  has_many :areas, through: :cities

  #默认排序
  default_scope -> { order(id: :asc) }
  #按降序排列
  scope :descent, -> { order(id: :desc) }

end