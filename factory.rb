class Factory
  def self.new(*attrs,&block)

    my_class = Class.new do
      attr_accessor *attrs
      define_method :initialize do |*arr_args|
        attrs.each_with_index do |attr,index|
          self.send("#{attr}=",arr_args[index])
        end
      end

      define_method :[] do |attr|
          attr.is_a?(Fixnum)? send("#{attrs[attr]}") : send(attr)
      end

      define_method :[]= do |attr,value|
        attr.is_a?(Fixnum)? send("#{attrs[attr]}=",value) : send("#{attr}=",value)
      end

      define_method :to_h do
        Hash[attrs.each_slice(2).to_a]
      end

      define_method :to_a do
        attrs.map {|attr| send(attr)}
      end
      alias_method :values, :to_a

      define_method :values_at do |*array|
        array.map {|attr|  attr.is_a?(Fixnum)? send("#{attrs[attr]}") : send(attr)}
      end

      define_method :eql? do |other_obj|
        self.class == other_obj.class ? true : false
      end
      alias_method :==, :eql?

      define_method :size do
        attrs.size
      end
      alias_method :length, :size

      define_method :each do |&block|
        attrs.each(&block)
      end
    end
  end
end
