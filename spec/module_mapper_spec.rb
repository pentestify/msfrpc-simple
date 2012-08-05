require 'spec_helper'
describe "Msf" do 
  describe "RPC" do
    describe "Simple" do
      describe "ModuleMapper" do

        before :each do
        end

        it "maps modules for a standard HTTP endpoint" do 

          endpoint = { 
            :ip_address => "1.1.1.1",
            :port_num => 80,
            :transport => "TCP",
            :protocol => "HTTP"
          }

          endpoint_and_modules = Msf::RPC::Simple::ModuleMapper.get_discovery_modules_for_endpoint endpoint

          endpoint_and_modules[:ip_address].should == "1.1.1.1"
          endpoint_and_modules[:port_num].should == 80
          endpoint_and_modules[:transport].should == "TCP"
          endpoint_and_modules[:protocol].should == "HTTP"
          endpoint_and_modules[:modules_and_options].should include({ 
            :module_name => "auxiliary/scanner/http/http_version",
            :module_option_string => "RHOSTS 1.1.1.1, RPORT 80"
          })

        end

        it "maps modules for a non-standard HTTP endpoint" do 

          endpoint = { 
            :ip_address => "1.1.1.1",
            :port_num => 8080,
            :transport => "TCP",
          }

          endpoint_and_modules = Msf::RPC::Simple::ModuleMapper.get_discovery_modules_for_endpoint endpoint

          endpoint_and_modules[:ip_address].should == "1.1.1.1"
          endpoint_and_modules[:port_num].should == 8080
          endpoint_and_modules[:transport].should == "TCP"
          endpoint_and_modules[:protocol].should == "HTTP"
          endpoint_and_modules[:modules_and_options].should include({ 
            :module_name => "auxiliary/scanner/http/http_version",
            :module_option_string => "RHOSTS 1.1.1.1, RPORT 8080"
          })

        end


      end
    end
  end
end
