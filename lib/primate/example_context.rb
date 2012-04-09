class Primate::ExampleContext
  attr_accessor :title, :example_input_context, :example_output_context

  def initialize(title,&block)
    self.instance_eval &block
  end

  def input(&block)

  end

  def output(&block)

  end

  def match_input(env)
    false
  end

  def produce_output

  end

end

