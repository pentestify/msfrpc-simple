# -*- encoding: utf-8 -*-
require File.expand_path('../lib/msfrpc-simple/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["jcran"]
  gem.email         = ["jcran@pentestify.com"]
  gem.description   = %q{Simple interface to Metasploit RPC}
  gem.summary       = %q{Simple interface to Metasploit RPC}
  gem.homepage      = "http://www.github.com/jcran/msfrpc-simple"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "msfrpc-simple"
  gem.require_paths = ["lib"]
  gem.version       = Msf::RPC::Simple::VERSION
end
