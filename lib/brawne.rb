require 'active_support/core_ext/module/attribute_accessors'
require "brawne/request.rb"
require "brawne/version.rb"

module Brawne
  @@_ran_once = false

  mattr_accessor :host, :port, :ssl, :user, :token
  @@host, @@port, @@ssl, @@user, @@token = nil, nil, nil, nil, nil

  def self.setup
    yield self if @@_ran_once == false
    @@_ran_once = true
  end

  def self.load_and_set_settings!
    Kernel.send(:remove_const, 'BRAWNE_HOST') if Kernel.const_defined?('BRAWNE_HOST')
    Kernel.const_set('BRAWNE_HOST', Brawne.host)
    Kernel.send(:remove_const, 'BRAWNE_PORT') if Kernel.const_defined?('BRAWNE_PORT')
    Kernel.const_set('BRAWNE_PORT', Brawne.port)
    Kernel.send(:remove_const, 'BRAWNE_SSL') if Kernel.const_defined?('BRAWNE_SSL')
    Kernel.const_set('BRAWNE_SSL', Brawne.ssl)
    Kernel.send(:remove_const, 'BRAWNE_USER') if Kernel.const_defined?('BRAWNE_USER')
    Kernel.const_set('BRAWNE_USER', Brawne.user)
    Kernel.send(:remove_const, 'BRAWNE_TOKEN') if Kernel.const_defined?('BRAWNE_TOKEN')
    Kernel.const_set('BRAWNE_TOKEN', Brawne.token)
  end
  
end