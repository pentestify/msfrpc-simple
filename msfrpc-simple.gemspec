# -*- encoding: utf-8 -*-
require File.expand_path('../lib/msfrpc-simple/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["jcran"]
  gem.email         = ["jcran@pentestify.com"]
  gem.description   = %q{Simple wrapper for the Metasploit RPC API}
  gem.summary       = %q{This library provides a simple-to-use wrapper for the Rapid7 Metasploit RPC API}
  gem.homepage      = "http://www.github.com/jcran/msfrpc-simple"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "msfrpc-simple"
  gem.require_paths = ["lib"]
  gem.version       = Msf::RPC::Simple::VERSION
  
  gem.add_dependency("msfrpc-client")
  #gem.add_dependency("librex")

end
