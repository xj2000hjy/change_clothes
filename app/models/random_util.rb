module JackLau::RandomUtil
  ##
  # 说明:
  #  生成随机数辅助模块
  # 使用:
  #  include RandomUtil
  #
  #生成指定长度的随机数(数字和小写字母混合)
  def generate_random(len=8)
    rand(36 ** len).to_s(36)
  end

  #生成指定长度的随机数(数字和大小写字母混合)
  def generate_password_salt(len=8)
    rnd = (0...len).collect{|i| rand(62)}
    if RUBY_VERSION > '1.8.7'
      [*(0..9),*('a'..'z'),*('A'..'Z')].values_at(*rnd).join('')
    else
      num = *(0..9)
      alpha1 = *('A'..'Z')
      alpha2 = *('a'..'z')
      (num+alpha1+alpha2).values_at(*rnd).join
    end
  end

  #按日期时间生成随机序列号
  def generate_time_random
    s_number = Time.now.strftime('%y%m%d')
    cs = [*(0..9)].join('')
    1.upto 5 do
      r = rand(cs.length)
      s_number << cs[r, 1]
    end
    return s_number
  end

  #声明可以用于视图模块中
  helper_method :generate_random,:generate_password_salt,:generate_time_random
end