class Primate::Api
  attr_accessor :root_dir, :files, :context, :http_router

  def initialize(dir)
    self.root_dir = dir
    self.http_router = ::HttpRouter.new
    self.http_router.extend_route do
      attr_accessor :input, :output, :examples
    end
    self.context = Primate::ApiContext.new(self)
    find_files
    load_files
  end

  def find_files
    self.files = Dir.glob(root_dir+'/**/*.rb')
  end

  def load_files
    self.files.each do |f|
      context.instance_eval(File.read(f),f)
    end
  end

  def run
  end
end
