require 'rack'
require 'rack-zippy'
require 'rack/contrib/try_static'

use Rack::Zippy::AssetServer, 'build'
use Rack::TryStatic, root: 'build', urls: %w[/], try: ['.html', 'index.html', '/index.html']

run lambda{ |env| [ 404, { 'Content-Type'  => 'text/html' }, ['404 - page not found'] ] }
