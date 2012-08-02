require 'spec_helper'
describe "Msf" do 
  describe "RPC" do
    describe "Simple" do
      describe "Client" do

        it "connects to local default msfrpcd" do
          
        # This spec requrires the msfrpcd to be runnning... 
        #
        # ./msfrpcd -P test -U test
        #

          client = Msf::RPC::Simple::Client.new("default", "test", "test", { 	
           # :host => "127.0.0.1",
           # :port => 55553,
           # :uri => '/api/'
           # :ssl => true, 
           # :password => 'test'
          })

          client.connected?.should be_true  
        end
      end
    end
  end
end
