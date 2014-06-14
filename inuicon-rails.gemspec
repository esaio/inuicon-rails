# -*- encoding: utf-8 -*-
require File.expand_path('../lib/inuicon-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["TAEKO AKATSUKA / @ken_c_lo"]
  gem.email         = ["igiari@gmail.com"]
  gem.description   = %q{Icon web font for Rails (used in pplog.net) https://taea.github.io/inuicon/demo.html}
  gem.summary       = %q{Icon web font for Rails (used in pplog.net) https://taea.github.io/inuicon/demo.html}
  gem.homepage      = "https://github.com/taea/inuicon-rails"

  gem.files         = Dir["{app,lib}/**/*"] + ["MIT-LICENSE", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "inuicon-rails"
  gem.require_paths = ["lib"]
  gem.version       = InuiconRails::VERSION

  gem.add_dependency "sass-rails"
end
