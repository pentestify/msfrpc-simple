$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'msfrpc-client'
require 'features/framework'
require 'features/pro'

module Msf
  module RPC
    module Simple
      class Client

        include Msf::RPC::Simple::Features::Framework
        include Msf::RPC::Simple::Features::Pro

        # Public: Create a simple client object.
        #
        # opts - hash of options to include in our initial connection.
        # project - project name we want to use for this connection.
        #
        # Returns nothing.
        def initialize(project="default", username, password, options)

          #
          # Merge our project in, and set this as the project we'll
          # use going forward. 
          #
          opts = options.merge(:project => project)
          opts = options.merge(:port => 55553)
          
          #
          # Connect to the RPC daemon using the default r7 client
          #
          @rpc = Msf::RPC::Client.new(opts)

          #
          # Create a logger
          #
          @logger = Msf::RPC::Simple::Logger.new
          
          #
          # Store the temp token for later use
          #
          response = @rpc.call("auth.login",username, password)
          @token = response[:token]
          
          #puts "Got response: #{response}"
        end

        #
        #
        #
        def connected?
          return true #if @rpc.send("core.version", @token)
        end
      end
    end
  end
end