module Middleware
  class RequestLogger
    def initialize(app, logger = nil)
      @app    = app
      @logger = logger || Logger.new(STDOUT)
    end

    def call(env)
      unless ENV["RACK_ENV"] == "development"
        return @app.call(env)
      end

      headers = env.
        select { |k,_| k =~ /^HTTP_/ }.
        map { |pair| [pair[0].sub(/^HTTP_/, ""), pair[1]].join(": ") }.
        sort

      request_params = env['rack.input'].read

      @logger.info "Request: #{env["REQUEST_METHOD"]} #{env["PATH_INFO"]} #{headers} #{request_params}"

      @app.call(env).tap do |response|
        status, headers, body = *response

        @logger.info "Response: #{status}"
        @logger.info "Headers: #{headers}"
        @logger.info "Response:"

        body.each do |line|
          @logger.info(line)
        end

        @logger.info ""
      end
    end
  end
end
