# -*- encoding: utf-8 -*-
require File.expand_path('../lib/inuicon-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["TAEKO AKATSUKA / @ken_c_lo"]
  gem.email         = ["igiari@gmail.com"]
  gem.description   = %q{Icon web font for Rails (used in pplog.net) https://taea.github.io/inuicon/demo.html}
  gem.summary       = %q{Icon web font for Rails (used in pplog.net) https://taea.github.io/inuicon/demo.html}
  gem.homepage      = "https://github.com/taea/inuicon-rails"

  gem.files         = Dir["{lib,vendor}/**/*"] + ["MIT-LICENSE", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "inuicon-rails"
  gem.require_paths = ["lib"]
  gem.version       = InuiconRails::VERSION

  gem.add_dependency "sass-rails"

  # get an array of submodule dirs by executing 'pwd' inside each submodule
  `git submodule --quiet foreach pwd`.split($\).each do |submodule_path|
    # for each submodule, change working directory to that submodule
    Dir.chdir(submodule_path) do

      # issue git ls-files in submodule's directory
      submodule_files = `git ls-files`.split($\)

      # prepend the submodule path to create absolute file paths
      submodule_files_fullpaths = submodule_files.map do |filename|
        "#{submodule_path}/#{filename}"
      end

      # remove leading path parts to get paths relative to the gem's root dir
      # (this assumes, that the gemspec resides in the gem's root dir)
      submodule_files_paths = submodule_files_fullpaths.map do |filename|
        filename.gsub "#{File.dirname(__FILE__)}/", ""
      end

      # add relative paths to gem.files
      gem.files += submodule_files_paths
    end
  end
end
