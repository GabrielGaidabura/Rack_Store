#\ -p 8080

system "clear"

require File.expand_path("./store.rb", "app")
require File.expand_path("./resque_middleware.rb", "middleware")
require File.expand_path("./static_middleware.rb", "middleware")
require File.expand_path("./session_middleware.rb", "middleware")

use Rack::Reloader, 0
#use Ex_catcher
use Static
use Session

run Store.new
