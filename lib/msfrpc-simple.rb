#
# this file exists to be a top level for the gem
# 
$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), 'msfrpc-simple')))

require 'version'
require 'client' # our simple client
