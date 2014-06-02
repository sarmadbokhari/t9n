module The99Names
  class Entity
    def initialize(attrs=nil)
      attrs && attrs.each do |attr, value|
        setter = "#{attr}="
        self.send(setter, value) if self.class.method_defined?(setter)
      end
    end
  end
end
