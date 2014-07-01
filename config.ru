require "./init"
require "raven"
require "rack/revision"

use Middleware::ExceptionHandler
use Raven::Rack
use Rack::Revision
use Middleware::RequestLogger

run Service::Application
