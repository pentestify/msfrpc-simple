require 'spec_helper'
describe "MsfRpc" do
  describe "Simple" do
    describe "Client" do

      it "connects to local default msfrpcd" do
        
        client = MsfRpc::Simple::Client.new { 	
         # :host => "127.0.0.1",
         # :port => 55553,
         # :uri => '/api/'
         # :ssl => true, 
         # :password => 'test'
        }

        client.connected?.should be_true  
      end

    end
  end
end
