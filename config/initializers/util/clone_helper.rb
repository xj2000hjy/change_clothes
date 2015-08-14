#!ruby
class Object
  def deep_clone
    _deep_clone({})
  end

  protected
  def _deep_clone(cloning_map)
    return cloning_map[self] if cloning_map.key? self
    cloning_obj = clone
    cloning_map[self] = cloning_obj
    cloning_obj.instance_variables.each do |var|
      val = cloning_obj.instance_variable_get(var)
      begin
        val = val._deep_clone(cloning_map)
      rescue TypeError
        next
      end
      cloning_obj.instance_variable_set(var, val)
    end
    cloning_map.delete(self)
  end
end

class Array
  protected
  def _deep_clone(cloning_map)
    return cloning_map[self] if cloning_map.key? self
    cloning_obj = super
    cloning_map[self] = cloning_obj
    cloning_obj.map! do |val|
      begin
        val = val._deep_clone(cloning_map)
      rescue TypeError
        #
      end
      val
    end
    cloning_map.delete(self)
  end
end

class Hash
  protected
  def _deep_clone(cloning_map)
    return cloning_map[self] if cloning_map.key? self
    cloning_obj = super
    cloning_map[self] = cloning_obj
    pairs = cloning_obj.to_a
    cloning_obj.clear
    pairs.each do |pair|
      pair.map! do |val|
        begin
          val = val._deep_clone(cloning_map)
        rescue TypeError
          #
        end
        val
      end
      cloning_obj[pair[0]] = pair[1]
    end
    cloning_map.delete(self)
  end
end

class Object
  #def deep_clone
  #  Marshal::load(Marshal.dump(self))
  #end

  def dclone
    case self
      when Fixnum,Bignum,Float,NilClass,FalseClass,
           TrueClass,Continuation
        klone = self
      when Hash
        klone = self.clone
        self.each{|k,v| klone[k] = v.dclone}
      when Array
        klone = self.clone
        klone.clear
        self.each{|v| klone << v.dclone}
      else
        klone = self.clone
    end
    klone.instance_variables.each {|v|
      klone.instance_variable_set(v,klone.instance_variable_get(v).dclone)
    }
    klone
  end
end