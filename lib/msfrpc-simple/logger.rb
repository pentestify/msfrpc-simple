$:.unshift(File.expand_path(File.dirname(__FILE__)))
require 'msfrpc-client'


module Msf
  module RPC
    module Simple
      class Logger

        def initialize(filename="msfrpc-simple.log")
          @log = File.open(filename, "w+")
        end

        def log(text)
          @log.puts text
        end

        def close 
          @log.close
        end

      end
    end
  end
end