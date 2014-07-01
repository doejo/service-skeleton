require "sinatra"
require "sinatra/activerecord"
require "json"

module Service
  class Application < Sinatra::Base
    include Service::Helpers
    include Service::Authentication

    configure do
      set :dump_errors,     false
      set :raise_errors,    true
      set :show_exceptions, false
    end

    before do
      content_type :json, encoding: "utf8"
    end

    not_found do
      error_response("Invalid endpoint", 404)
    end
  end
end