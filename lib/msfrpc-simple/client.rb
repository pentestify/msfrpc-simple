$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'msfrpc-client'
require 'features/framework'
require 'features/pro'
require 'module_mapper'
require 'logger'

module Msf
  module RPC
    module Simple
      class Client

        include Msf::RPC::Simple::Features::Framework
        include Msf::RPC::Simple::Features::Pro

        attr_accessor :options

        # Public: Create a simple client object.
        #
        # opts - hash of options to include in our initial connection.
        # project - project name we want to use for this connection.
        #
        # Returns nothing.
        def initialize(user_options)

          # db username
          # db password 

          #
          # Merge our project in, and set this as the project we'll
          # use going forward. 
          #
          @options = {
            :project => user_options[:project] || "default", 
            :port => user_options[:project] || 55553,
            :user => user_options[:rpc_user], 
            :pass => user_options[:rpc_pass], 
            :db_user => user_options[:db_user],
            :db_pass => user_options[:db_pass]
          }
          
          @options.merge!(user_options)

          #
          # Connect to the RPC daemon using the default client
          #
          @client = Msf::RPC::Client.new(@options)

          #
          # Create a logger
          #
          #@logger = Msf::RPC::Simple::Logger.new
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