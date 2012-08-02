require 'spec_helper'
describe "Msf" do 
  describe "RPC" do
    describe "Simple" do
      describe "Logger" do

        it "writes to a logfile" do

          @logger = Msf::RPC::Simple::Logger.new
          @logger.log "test"
          @logger.close

          File.open("msfrpc-simple.log").read.should == "test\n"

        end
      end
    end
  end
end