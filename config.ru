require "./init"
require "raven"
require "rack/revision"

use Middleware::ExceptionHandler
use Middleware::RequestLogger, Logger.new("./log/requests.log")
use Raven::Rack
use Rack::Revision

run Service::Application
