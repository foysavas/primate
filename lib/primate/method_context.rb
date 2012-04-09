class Primate::MethodContext

  def initialize(api,route,&block)
    @api = api
    @route = route
    if @route.examples.nil?
      @route.examples = []
    end
    self.instance_eval &block
  end

  def input(&block)
    if @route.input.nil?
      @route.input = 0xbad # Primate::InputContext.new(&block)
    else
      throw "Multiple input for single route."
    end
  end

  def output
    #if output_context.nil?
    #end
  end

  def example(title="Unnamed Example",&block)
    @route.examples.push Primate::ExampleContext.new(title,&block)
  end
end
