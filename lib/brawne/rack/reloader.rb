module Brawne
  module Rack
    # Rack middleware the reloads RailsConfig on every request (only use in dev mode)
    class Reloader
      def initialize(app)
        @app = app
      end

      def call(env)
        Brawne.load_and_set_settings!
        @app.call(env)
      end
    end
  end
end