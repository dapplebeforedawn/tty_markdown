Gem::Specification.new do |s|
  s.name        = 'tty_markdown'
  s.version     = '0.0.2'
  s.date        = '2013-09-14'
  s.summary     = "colorized markdown up in your tty"
  s.description = "reads a file or STDIN and outputs colorized markdown to STDOUT"
  s.authors     = ["Mark Lorenz"]
  s.email       = 'markjlorenz@gmail.com'
  s.homepage    =
    'http://github.com/dapplebeforedawn'
  s.license     = 'MIT'

  s.files         = %w[ lib/tty_markdown.rb  lib/ruby_color.rb
                        lib/unknown_color.rb bin/tty_md ]
  s.executables   = %w[ tty_md ]
  s.require_paths = ["lib"]

  s.add_dependency 'colorize',  '0.5.8'
  s.add_dependency 'redcarpet', '3.0.0'
  s.add_dependency 'syntax',    '1.0.0'
end
