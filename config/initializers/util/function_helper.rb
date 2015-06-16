##
#辅助类(若在新环境中将此文件放在config/initializers/文件夹下,启动自动加载...)
# 说明:
#   常用操作辅助模块
# 使用:
#   require 'function_helper' -- 可选(前提是文件放在config/initializers/文件夹)
#   include UntilHelper
#
module FunctionHelper
  #定义钩子方法-类扩展
  def self.included(base) #模块用 included
    # @@target_class = base
    base.extend(FunctionHelper) #在模块中定义相关的类方法
    super
  end

  #在引模块下定义类方法
  module FunctionHelper
    #检测变量是否为空值
    def check_null(val)
      if (val.blank? || val.empty?)
        value = ''
      else
        value = val.strip!
      end

      return value
    end
  end
end