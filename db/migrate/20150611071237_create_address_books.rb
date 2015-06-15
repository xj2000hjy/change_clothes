#--------------------------------------------------
class CreateAddressBooks < ActiveRecord::Migration
  def change
    create_table :address_books do |t|
      t.string :username #登录用户名
      t.string :password #登录密码
      t.string :password_salt #登录密码加密密钥

      t.string :name #真实姓名
      t.integer :sex, default: -1 #性别,0:女,1:男,-1:隐藏
      t.string :head_portrait #头像

      t.string :birthday  #出生日期
      t.integer :age  #年龄(系统自动根据出生日期算出)

      t.string :telephone #电话号码(固)
      t.string :mobile  #移动电话
      t.string :qq  #QQ号码
      t.string :email #电子邮箱
      t.string :weixin #微信号

      t.string :birth_province_code #出生省份
      t.string :birth_city_code #出生城市
      t.string :birth_area_code #出生地区
      t.string :live_province_code #现居住省份
      t.string :live_city_code  #现居住城市
      t.string :live_area_code  #现居住地区

      t.string :ip #登录IP地址
      t.string :login_address #登录地址(根据IP算出)
      t.integer :login_count, default: 0 #登录次数

      t.boolean :is_valid, default: true #是否锁定(false:锁定,true:有效)

      t.timestamps null: false
    end
  end
end
#--------------------------------------------------