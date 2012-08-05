require 'spec_helper'
describe "Msf" do 
  describe "RPC" do
    describe "Simple" do
      describe "Client" do

        before :each do
        
          @client = Msf::RPC::Simple::Client.new("default", "test", "test", {  
           # :host => "127.0.0.1",
           # :port => 55553,
           # :uri => '/api/'
           # :ssl => true, 
           # :password => 'test'
          })

        end


        it "connects to local default msfrpcd" do
          
        # This spec requrires the msfrpcd to be runnning... 
        #
        # ./msfrpcd -P test -U test
        #

          #
          # notice how this client isn't @client, allowing us to modify @client
          # as necessary
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


        it "runs a module and gives the output" do 
          output = @client.execute_module_and_return_output({
            :module_name => "auxiliary/scanner/http/http_version", 
            :module_option_string => "RHOSTS www.google.com,THREADS 10"
          })
          output.should include "Auxiliary module execution completed"
        end
        
        it "runs a basic discover with framework modules" do 
          output = @client.discover_host("www.google.com")          
          output.should include "Auxiliary module execution completed"
        end
      end
    end
  end
end
