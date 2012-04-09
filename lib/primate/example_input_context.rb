class Primate::ExampleInputContext

  attr_accessor :guards

  def initialize(&block)
    self.instance_eval &block
  end

  def param(k,v,&block)
    guards[
    if block
      param_nest_push(k)
      self.instance_eval &block
      param_nest_pop
    end
  end

  private

  def param_nest
    @param_nest || []
  end

  def push_param_nest(v)
    @param_nest.push(v)
  end

  def pop_param_nest
    @param_nest.pop
  end

end
