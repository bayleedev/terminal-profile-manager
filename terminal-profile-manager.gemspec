Gem::Specification.new do |s|
  s.authors       = 'Blaine Schmeisser'
  s.name          = 'terminal-profile-manager'
  s.email         = 'blainesch@gmail.com'
  s.homepage      = 'https://github.com/blainesch/terminal-profile-manager'
  s.version       = '0.0.2'
  s.summary       = 'Automate terminal profile management.'
  s.description   = 'Try out new profiles, and setup your mac easier.'
  s.licenses      = ['MIT']
  s.require_paths = ['lib', 'bin']
  s.files         = `git ls-files`.split("\n")
  s.has_rdoc      = false
  s.executables   <<  'tpm'
end
