class Classmate::AddressBookController < ApplicationController
  #验证用户登录
  http_basic_authenticate_with name: 'admin', password: 'admin', :only => :login

  def login
   @user = AddressBook.new
  end

  def logout

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def delete

  end

  def show

  end

  def index

  end

  #检测登录用户是否有效
  def check_valid

  end

  def publish_info

  end
end
