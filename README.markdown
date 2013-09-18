# What's it Do:
Pretty prints markdown in the terminal
![tty_md example](http://i.imgur.com/EdaTm3k.png)

## Installing it:
In a Gemfile
```
gem 'tty_markdown', :git => 'git://github.com/dapplebeforedawn/tty_markdown.git'
```

The gem (not on rubygems.org yet) comes with a binary, so if you:
```bash
# Download the source:
git clone https://github.com/dapplebeforedawn/tty_markdown.git

# Build the gem:
cd tty_markdown 
gem build tty_markdown.gemspec

# Install it (the version may vary)
gem install tty_markdown-0.0.1.gem
```

## Using the Binary:
You now have access to the `tty_md` command in your prompt.  Give it a filename as the first argument (`tty_md your_doc.markdown`), or pipe markdown to it (`echo "# I'm a header" | tty_md`), and you'll see pretty colors.  For my recursive joke loving peeps: `tty_md tty_markdown/README.markdown` to read this file pretty printed.

## Using it Ruby Code:
```ruby
markdown = Redcarpet::Markdown.new(Redcarpet::Render::ColorDown, fenced_code_blocks: true)
text     = markdown.render File.read("a_file.markdown")
puts(text)
```

# Support
This code is u.g.l.y, and also my first gem.  Pull requests totally accepted.

