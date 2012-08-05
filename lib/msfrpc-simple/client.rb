$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'msfrpc-client'
require 'features/framework'
require 'features/pro'
require 'pry'

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
        def initialize(project="default", username, password, user_opts)

          #
          # Merge our project in, and set this as the project we'll
          # use going forward. 
          #
          conn_params = { 
            :project => project, 
            :port => 55553,
            :user => username, 
            :pass => password 
          }

          user_opts.merge!(conn_params)
          
          #
          # Connect to the RPC daemon using the default r7 client
          #
          @client = Msf::RPC::Client.new(user_opts)

          #
          # Create a logger
          #
          @logger = Msf::RPC::Simple::Logger.new
          
          #
          # Store the temp token for later use
          #
          #response = @rpc.call("auth.login",username, password)
          #@token = response["token"]
          #binding.pry
        end

        #
        #  
        #
        def connected?
          return true if @client.call("core.version")   
        end
      end
    end
  end
end