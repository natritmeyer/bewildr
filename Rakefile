require 'rubygems'
require 'rake'
require 'rdoc/task'

RDoc::Task.new do |rdoc|
  files =['README.rdoc', 'LICENSE', 'lib/**/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = "README.rdoc" # page to start on
  rdoc.title = "bewildr Docs"
  rdoc.rdoc_dir = 'doc/rdoc' # rdoc output folder
  rdoc.options << '--line-numbers'
end

