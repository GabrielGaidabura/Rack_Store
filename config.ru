#\ -p 8080

system "clear"

require File.expand_path("./store.rb", "app")

use Rack::Reloader, 0

run Store.new
