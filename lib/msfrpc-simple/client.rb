$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'msfrpc-client'
require 'features/framework'
require 'features/pro'

module MsfRpc
  module Simple
    class Client

      include MsfRpc::Simple::Features::Framework
      include MsfRpc::Simple::Features::Pro

      def initialize(opts)
        @rpc = Msf::RPC::Client.new(opts)
      end

      def connected?
        true
      end
    end

  end
end