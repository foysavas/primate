require 'spec_helper'

describe "Twitter Example Spec" do

  it "should load api files and setup the http router" do
    api = Primate::Api.new(File.expand_path("#{EXAMPLES_DIR}/twitter"))
    api.http_router.class.should be HttpRouter
    api.http_router.recognize(
      Rack::MockRequest.env_for("/users/show.json")
    ).first.first.class.should be HttpRouter::Response
    api.http_router.recognize(
      Rack::MockRequest.env_for("/nothing-at-this-path")
    ).first.should be nil
  end

  it "should do more stuff!"

end
