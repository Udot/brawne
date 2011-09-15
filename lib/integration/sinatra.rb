require "brawne/rack/reloader"

module Brawne
  # provide helper to register within your Sinatra app
  # set :root, File.dirname(__FILE__)
  # register Brawne
  def self.registered(app)
    app.configure do |inner_app|
      env = inner_app.environment || ENV["RACK_ENV"]
      root = inner_app.root
      Brawne.load_and_set_settings!
      inner_app.use(::Brawne::Rack::Reloader) if inner_app.development?
    end
  end

end