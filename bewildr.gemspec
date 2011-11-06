Gem::Specification.new do |s|
  s.name = 'bewildr'
  s.version = '0.1.14'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc', 'LICENSE']
  s.summary = 'Test WPF UI apps with IronRuby'
  s.description = s.summary
  s.author = 'Nat Ritmeyer'
  s.email = 'nat@natontesting.com'
  s.homepage = 'http://www.bewildr.info'
  s.files = %w(LICENSE README.rdoc) + Dir.glob("{bin,lib}/**/*")
  s.require_path = "lib"
  s.bindir = "bin"
end