require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/testtask'
require 'spec/rake/spectask'
require 'cucumber'
require 'cucumber/rake/task'

spec = Gem::Specification.new do |s|
  s.name = 'bewildr'
  s.version = '0.1.3'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc', 'LICENSE']
  s.summary = 'Test WPF UI apps with (iron) ruby!'
  s.description = s.summary
  s.author = 'Nat Ritmeyer'
  s.email = 'nat@natontesting.com'
  s.homepage = 'http://github.com/natritmeyer/bewildr'
  s.files = %w(LICENSE README.rdoc Rakefile) + Dir.glob("{bin,lib}/**/*")
  s.require_path = "lib"
  s.bindir = "bin"
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = true
  p.need_zip = true
end

Rake::RDocTask.new do |rdoc|
  files =['README.rdoc', 'LICENSE', 'lib/**/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = "README.rdoc" # page to start on
  rdoc.title = "bewildr Docs"
  rdoc.rdoc_dir = 'doc/rdoc' # rdoc output folder
  rdoc.options << '--line-numbers'
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*.rb']
end

Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.libs << Dir["lib"]
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty -q"
end
