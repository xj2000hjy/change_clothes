##
#随机数生成类(若在新环境中将此文件放在config/initializers/文件夹下,启动自动加载...)
# 说明:
#   生成随机数辅助模块
# 使用:
#   require 'until_random' -- 可选(前提是文件放在config/initializers/文件夹)
#   include JackLau::UtilRandom
#
module JackLau
  module UtilRandom
    require 'base64'
    require 'md5'
    require 'bcrypt' #gem install bcrypt

    #定义钩子方法-类扩展混入
    def self.included(base) #模块用 included
      # @@target_class = base
      # puts base
      base.extend(RandomHelper) #在模块中定义相关的类方法
      super
    end

    #随机数生成模块
    module RandomHelper

      #获取随机字母数--类方法(直接用类来调用)
      def get_random(len = 8)
        [*('a'..'z')].sample(len).join('')
      end

    end

    # #定义钩子方-类扩展混入
    # def self.included(base)
    #   base.extend(self)
    # end
    #
    # #监测方法动态添加
    # def self.method_added(method_name)
    #   Rails.logger.info("模块UtilRandom添加了方法: #{method_name}")
    # end


    #生成指定长度的随机数(数字和小写字母混合)--类的实例方法
    def generate_random(len = 8)
      rand(36 ** len).to_s(36)
    end

    #生成指定长度的随机数(数字和大小写字母混合)--类的实例方法
    def generate_password(len = 8)
      rnd = (0...len).collect{|i| rand(62)}
      if RUBY_VERSION > '1.8.7'
        result = [*(0..9), *('a'..'z'), *('A'..'Z')]
      else
        num = *(0..9)
        alpha1 = *('A'..'Z')
        alpha2 = *('a'..'z')
        result = num + alpha1 + alpha2
      end

      result.values_at(*rnd).join('')
    end

    #按日期时间生成18位随机序列号--类的实例方法
    def generate_time_random
      num = 10
      s_number = Time.now.strftime('%Y%m%d')
      cs = [*(0..9)].join('')
      [*(0...num)].each do
        r = rand(cs.length)
        s_number << cs[r, 1]
      end

      s_number
    end

    #生成指定个数的随机数--类的实例方法
    def generate_random_alphabet(len = 8)
      if RUBY_VERSION > '1.8.7'
        result = [*('a'..'z'),*('A'..'Z')]
      else
        result = ('a'..'z').to_a << ('A'..'Z').to_a
      end
      # result.sample(len).join('')
      result.shuffle[0...len].join('')
    end

    #生成指定长度的随机码
    def get_random(length=32)
      Base64.encode64(OpenSSL::Random.random_bytes(32)).gsub(/\W/, '')[0, length]
    end

    #生成Token指令
    def create_token(str=Time.now.to_i)
      MD5.md5(str)
    end

    #密码加密
    def encrytp_password(pwd = '')
      BCrypt::Engine.hash_secret(password, BCrypt::Engine.generate_salt)
    end

    #获取指定长度的随机密码
    def get_rand_password(length=10)
      Array.new(length).map { (65 + rand(58)).chr }.join
    end
  end
end