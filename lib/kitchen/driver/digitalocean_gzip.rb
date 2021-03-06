require 'kitchen'
require 'kitchen/sshgzip'
require 'kitchen/driver/digitalocean'

module Kitchen
  module Driver
    class DigitaloceanGzip < Digitalocean
      def upload_chef_data(ssh_args)
        Kitchen::GzippedChefDataUploader.new(
          instance, ssh_args, config[:kitchen_root], chef_home
        ).upload
      end
    end
  end
end
