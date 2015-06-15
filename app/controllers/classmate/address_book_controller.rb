class Classmate::AddressBookController < ApplicationController
  #验证用户登录
  http_basic_authenticate_with name: 'admin', password: 'admin', :only => :login

  def login
   addr =  AddressBook.create
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

  def check_valid
  end
end
