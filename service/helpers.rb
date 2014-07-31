module Service
  module Helpers
    def json_response(object, options = nil)
      if object.respond_to?(:to_json)
        object.to_json(options)
      else
        JSON.dump(object)
      end
    end

    def success_response(object, options = nil)
      json_response(object)
    end

    def error_response(message, status = 400)
      halt(status, json_response(error: message, status: status))
    end
  end
end