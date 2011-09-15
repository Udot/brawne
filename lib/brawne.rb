require 'net/http'
require "net/https"

class Brawne
  
  attr_accessor :host, :port, :ssl, :user, :token 
  
  def initialize(host, port, ssl, user, token)
    @host, @port, @ssl, @user, @token = host, port, ssl, user, token
  end
  
  def get(request)
    http_r = Net::HTTP.new(@host, @port)
    http_r.use_ssl = @ssl
    response = nil
    begin
      http_r.start() do |http|
        req = Net::HTTP::Get.new(request)
        req.add_field("USERNAME", @user)
        req.add_field("TOKEN", @token)
        response = http.request(req)
      end
      return [response.code, response.body]
    rescue Errno::ECONNREFUSED
      return [503, "unavailable"]
    end
    
end