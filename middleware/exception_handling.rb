module Middleware
  class ExceptionHandler
    def initialize(app)
      @app = app
    end

    def call(env)
      begin
        @app.call(env)
      rescue => ex
        env["rack.errors"].puts ex
        env["rack.errors"].puts ex.backtrace.join("\n")
        env["rack.errors"].flush

        hash = { error: ex.to_s, status: 500 }

        # Set exception backtrace only for development mode
        if ENV["RACK_ENV"] == "development"
          hash[:backtrace] = ex.backtrace
          hash[:env]       = serialize_object(env)
        end

        [
          500,
          { "Content-Type" => "application/json" },
          [JSON.dump(hash)]
        ]
      end
    end

    private

    def serializable?(object)
      [Integer, String, Array, Hash].include?(object.class)
    end

    def serialize_object(data)
      data.select{|k,v| serializable?(v) }.inject({}) do |h, pair|
        h[pair.first] = pair.last.is_a?(Hash) ? serialize_object(pair.last) : pair.last
        h
      end
    end
  end
end