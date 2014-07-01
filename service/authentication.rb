module Service
  module Authentication
    def authenticate_request
      require_api_token
      validate_api_token
    end

    private

    def require_api_token
      if api_token.empty?
        error_response("API token required", 401)
      end
    end

    def validate_api_token
      if api_token != ENV["API_TOKEN"]
        error_response("Invalid API token", 401)
      end
    end

    def api_token
      @api_token ||= (params[:api_token] || request.env["HTTP_X_API_TOKEN"]).to_s
    end
  end
end