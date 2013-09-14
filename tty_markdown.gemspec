Gem::Specification.new do |s|
  s.name        = 'tty_markdown'
  s.version     = '0.0.1'
  s.date        = '2013-09-14'
  s.summary     = "colorized markdown up in your tty"
  s.description = "colorized markdown up in your tty"
  s.authors     = ["Mark Lorenz"]
  s.email       = 'markjlorenz@gmail.com'
  s.homepage    =
    'http://github.com/dapplebeforedawn'
  s.license       = 'MIT'

  s.files = %w[ lib/tty_markdown.rb lib/ruby_color.rb ]

  s.add_dependency 'colorize',  '0.5.8'
  s.add_dependency 'redcarpet', '3.0.0'
  s.add_dependency 'syntax',    '1.0.0'
end
