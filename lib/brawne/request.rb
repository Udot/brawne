require 'net/http'
require "net/https"

#
# simple module to wrap up http requests.
module Brawne
  module Request

    # simple get method
    # call a simple get on host using request
    def self.get(request)
      http_r = Net::HTTP.new(Brawne.host, Brawne.port)
      http_r.use_ssl = Brawne.ssl
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
    
    # simple post method.
    # send the payload to the host with request
    # the payload is expected to be json
    def self.post(request,payload)
      http_r = Net::HTTP.new(Brawne.host, Brawne.port)
      http_r.use_ssl = Brawne.ssl
      response = nil
      begin
        http_r.start() do |http|
          req = Net::HTTP::Post.new(request, initheader = {'Content-Type' =>'application/json'})
          req.add_field("USERNAME", Brawne.user)
          req.add_field("TOKEN", Brawne.token)
          req.body = payload
          req.set_form_data(payload)
          response = http.request(req)
        end
        return [response.code, response.body]
      rescue Errno::ECONNREFUSED
        return [503, "unavailable"]
      end
    end
    
  end
end
