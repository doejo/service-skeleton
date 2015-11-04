require "./init"
require "raven"
require "rack/revision"
require "rack/heartbeat"

use Middleware::ExceptionHandler
use Middleware::RequestLogger, Logger.new("./log/requests.log")
use Raven::Rack
use Rack::Revision
use Rack::Runtime
use Rack::Heartbeat

run Service::Application
