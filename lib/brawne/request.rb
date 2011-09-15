require 'net/http'
require "net/https"

module Brawne
  module Request
      
    def self.get(request)
      http_r = Net::HTTP.new(Brawne.host, Brawne.port)
      http_r.use_ssl = @ssl
      response = nil
      begin
        http_r.start() do |http|
          req = Net::HTTP::Get.new(request)
          req.add_field("USERNAME", Brawne.user)
          req.add_field("TOKEN", Brawne.token)
          response = http.request(req)
        end
        return [response.code, response.body]
      rescue Errno::ECONNREFUSED
        return [503, "unavailable"]
      end
    end
    
  end
end