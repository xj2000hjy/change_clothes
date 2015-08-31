##
# 功能:
#    随机数生成类(若在新环境中将此文件放在config/initializers/文件夹下,启动时会自动加载...)
# 说明:
#    生成随机数辅助模块
# 引用:
#    require 'until_random' -- 可选(前提是文件放在config/initializers/文件夹)
#    include JackLau::UtilRandom
# 使用:
#    直接使用里面的方法
#    puts generate_random(10)
#
# 修订时间:
#    2015-08-26 09:23:39
#
module JackLau
  module UtilRandom
    require 'base64'
    require 'digest/md5'
    require 'digest/sha1'
    require 'bcrypt' #gem install bcrypt
    require 'openssl'

    REVISE_DATE_TIME = '2015-08-26 09:23:39'

    #定义钩子方法-类扩展混入
    def self.included(base) #模块用 included
      # @@target_class = base
      # puts base
      base.extend(RandomHelper) #在模块中定义相关的类方法
      super
    end

    #随机数生成模块
    module RandomHelper
      #获取当前版本信息
    def get_util_random_version
      "----------------------------\r\n" <<
      "Author: JackLau\r\n" <<
      "Version: 1.0.0\r\n" <<
      "Revise: " + REVISE_DATE_TIME + "\r\n" <<
      "Copyright (C) 2015-2016\r\n" <<
      "----------------------------"
    end

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
      # s_number = Time.now.strftime('%F').gsub('-','')
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
    def create_token(str='')
      Digest::MD5.hexdigest(str)
    end

    #用户密码加密(不可逆)
    def encrypt_password(pwd = '')
      encrypt_salt = BCrypt::Engine.generate_salt
      BCrypt::Engine.hash_secret(pwd, encrypt_salt)
    end

    #使用SHA加密
    def encrypt_by_sha(str='')
      Digest::SHA1.hexdigest(str)
    end

    ALG = 'DES-EDE3-CBC'
    KEY = "mZ4Wjs6L"     #你的密钥
    DES_KEY = "nZ4wJs6L" #任意固定的值

    #加密
    def encode(str)
      des = OpenSSL::Cipher::Cipher.new(ALG)
      des.pkcs5_keyivgen(KEY, DES_KEY)
      des.encrypt
      cipher = des.update(str)
      cipher << des.final
      return Base64.encode64(cipher) #Base64编码，才能保存到数据库
    end

    #解密
    def decode(str)
      str = Base64.decode64(str)
      des = OpenSSL::Cipher::Cipher.new(ALG)
      des.pkcs5_keyivgen(KEY, DES_KEY)
      des.decrypt
      des.update(str) + des.final
    end

    #加密
    def des_encrypt(des_text, des_key)
      des = OpenSSL::Cipher::Cipher.new("DES-ECB")
      des.encrypt
      des.key = des_key
      result = des.update(des_text)
      result << des.final

      str = ""
      result.each_byte {|c| str += ("%02x" % c);}
      return str
    end

    #解密
    def des_decrypt(des_text, des_key)
      des = OpenSSL::Cipher::Cipher.new("DES-ECB")
      des.decrypt
      des.key = des_key
      result = des.update([des_text].pack('H*'))
      result << des.final

      return result
    end

    #获取指定长度的随机密码
    def get_rand_password(length=10)
      Array.new(length).map { (65 + rand(58)).chr }.join
    end

    #base64加密字符串
    def encrypt_string(str='')
      Base64.encode64(str)
    end

    #base64解密字符串
    def decrypt_string(str='')
      Base64.decode64(str)
    end

  end
end