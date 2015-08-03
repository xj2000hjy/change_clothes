class Classmate::AddressBooksController < ApplicationController
  #验证用户登录
  # http_basic_authenticate_with name: 'admin', password: 'admin', :only => :login

=begin
> rake routes
-------------------------------------------------------------------------------------------------------
              Prefix      Verb   URI Pattern                          Controller#Action
-------------------------------------------------------------------------------------------------------
                     root GET    /                                    classmate/address_books#login
      address_books_login GET    /address_books/login(.:format)       classmate/address_books#login
     address_books_logout GET    /address_books/logout(.:format)      classmate/address_books#logout
address_books_check_valid POST   /address_books/check_valid(.:format) classmate/address_books#check_valid
            address_books GET    /address_books(.:format)             classmate/address_books#index
                          POST   /address_books(.:format)             classmate/address_books#create
         new_address_book GET    /address_books/new(.:format)         classmate/address_books#new
        edit_address_book GET    /address_books/:id/edit(.:format)    classmate/address_books#edit
             address_book GET    /address_books/:id(.:format)         classmate/address_books#show
                          PATCH  /address_books/:id(.:format)         classmate/address_books#update
                          PUT    /address_books/:id(.:format)         classmate/address_books#update
                          DELETE /address_books/:id(.:format)         classmate/address_books#destroy
-------------------------------------------------------------------------------------------------------
=end
  #引入生成随机数模块
  include JackLau::UtilRandom

  def login
    @user = AddressBook.new
    # @rnd = generate_time_random
  end

  def logout

  end
  #地址簿列表
  def index
    @addresses = AddressBook.all
  end

  #查看指定的地址簿详细信息
  def show

  end

  #创建一个地址簿信息
  def new
    @address_book = AddressBook.new

  end

  #执行创建地址簿操作
  def create

  end

  #打开指定待编辑的地址簿
  def edit

  end

  #执行更新操作
  def update

  end

  #执行删除操作
  def destroy

  end

  #检测登录用户是否有效
  def check_valid

  end

  def publish_info

  end
end
