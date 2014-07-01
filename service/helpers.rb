module Service
  module Helpers
    def json_response(object)
      JSON.dump(object)
    end

    def success_response(object)
      json_response(object)
    end

    def error_response(message, status = 400)
      halt(status, json_response(error: message, status: status))
    end
  end
end