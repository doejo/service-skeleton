require "./init"
require "raven"
require "rack/revision"
require "middleware/exception_handling"

use ExceptionHandling
use Raven::Rack
use Rack::Revision

run Service::Application
