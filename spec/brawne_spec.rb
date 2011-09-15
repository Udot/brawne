require 'spec_helper'

describe Brawne do

  context "Test Configuration" do
    before :each do
      Brawne.setup do |config| 
        config.host = "localhost"
        config.port = "8080"
        config.ssl = true
        config.user = "Korben"
        config.token = "34524GVQSDCA2CT34CZDX2"
      end
    end
    it { Brawne.host.should eql("localhost") }
    it { Brawne.port.should eql("8080") }
    it { Brawne.ssl.should be_true }
    it { Brawne.user.should eql("Korben") }
    it { Brawne.token.should eql("34524GVQSDCA2CT34CZDX2") }
  end
  
  context "Test Configuration again !" do
    it { Brawne.host.should eql("localhost") }
    it { Brawne.port.should eql("8080") }
    it { Brawne.ssl.should be_true }
    it { Brawne.user.should eql("Korben") }
    it { Brawne.token.should eql("34524GVQSDCA2CT34CZDX2") }
  end
  
  context "Test Configuration" do
    before :each do
      Brawne.setup do |config| 
        config.host = "localhost"
        config.port = "8080"
        config.ssl = true
        config.user = "Korben"
        config.token = "34524GVQSDCA2CT34CZDX2"
      end
      Brawne.load_and_set_settings!
    end
    it "Test constantes" do
      ['BRAWNE_HOST','BRAWNE_PORT','BRAWNE_SSL','BRAWNE_USER','BRAWNE_TOKEN'].each do |constant|
        Kernel.const_defined?(constant).should be_true
      end
    end
    it { BRAWNE_HOST.should eql("localhost") }
    it { BRAWNE_PORT.should eql("8080") }
    it { BRAWNE_SSL.should be_true }
    it { BRAWNE_USER.should eql("Korben") }
    it { BRAWNE_TOKEN.should eql("34524GVQSDCA2CT34CZDX2") }
  end
  
end