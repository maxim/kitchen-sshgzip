# kitchen-sshgzip

Adds 2 new drivers to test-kitchen

* ssh_gzip - same as ssh_base, only dirs are gzipped and extracted for upload
* digitalocean_gzip - same as digitalocean, only see above

## Installation

Add this line to your application's Gemfile:

    gem 'kitchen-sshgzip', group: :integration

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kitchen-sshgzip

## Usage

In your .kitchen.yml file set driver to be 'ssh_gzip' or 'digitalocean_gzip'.

You can also write drivers that inherit from SSHGzip instead of SSHBase by
depending on this gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
