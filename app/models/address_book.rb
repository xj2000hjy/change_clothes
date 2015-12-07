class AddressBook < ActiveRecord::Base
  #引入生成随机数模块
  include JackLau::UtilRandom

  #default_scope -> { order(id: :desc) }
  default_scope lambda { order('id DESC')}

  #类方法
  class << self
    #添加新用户
    def add_user?(options = {})
      return false if options.blank?

      if not exists?(username: options[:username])
        # where查询返回数组类型
        # where(username: options[:username]).first_or_create(options)
        # where(username: options[:username]).first_or_initialize(options)
        # where(username: options[:username]).create(options)
        # find_or_initialize_by(username: options[:username])
        # find_or_create_by(username: options[:username])

        AddressBook.create(options)
        return true
      end

      false
    end

    #获取当前用户
    def get_user(id)
      return nil if id.blank?
      #find_by查询返回对象,若不存在则为nil
      find_by(id: id)
      #find_by(id: id).all
      #where(id: id).first
      #where(id: id).last
      #查看SQL语句: where(id: id).to_sql

      # find_by # ok
      # find_all_by # where()
      # scoped_by # where()
      # find_last_by # where().last
      # find_or_create #where().first_or_create
      # find_or_initialize_by # where().first_or_initialize
    end

    #更新用户信息
    def update_user?(id,options={})
      return false if id.blank?
      @addr = find_by(id: id)
      if @addr
        #@addr.update(options) #触发验证
        @addr.update_columns(options) #构建SQL语句,直接执行于数据库层,不会触发验证
        return true
      end

      false
    end

    #验证用户有效性
    def check_user_valid?(username,password)
      return false if (username.blank? && password.blank?)

      @result = where(username: username, password: password).not(is_admin: true)
      return true if @result

      false
    end

    #获取指定的用户角色列表
    def get_user_role(is_admin)
      return none if is_admin.blank?

      case is_admin
        when true
          self.where.not(is_admin:false ).pluck(:username, :name, :ip)
        when false
          self.where.not(is_admin: true).select('username,name,ip')
        else
          self.none
      end
    end
  end
end