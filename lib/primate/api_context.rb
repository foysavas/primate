class Primate::ApiContext

  def initialize(api)
    @api = api
  end

  def config(&block)

  end

  def get(path,&block)
    route = @api.http_router.get(path)
    method_context = Primate::MethodContext.new(@api,route,&block)
    route.to do |env|
      method_context.handle_request(env)
    end
  end

  def post(path,&block)
    method_context = Primate::MethodContext.new(&block)
    @api.http_router.add(path).request_method("GET").to do |env|
      method_context.handle_request(env)
    end
  end


end
