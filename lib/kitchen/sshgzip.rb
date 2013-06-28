require 'kitchen'
require 'kitchen/sshgzip/version'
require 'tmpdir'

module Kitchen
  class GzippedChefDataUploader < ChefDataUploader
    def upload_path(scp, path, dir = File.basename(path))
      if File.directory?(path)
        tmp_root = Dir.mktmpdir('gzipped_chef_upload')
        gzip_path = "#{tmp_root}/#{dir}.tar.gz"
        system "cd #{path} && tar -zcf #{gzip_path} ."
        super(scp, gzip_path, "#{dir}.tar.gz")
        scp.session.exec! "cd #{chef_home} && mkdir #{dir} && " +
          "tar -zxf #{dir}.tar.gz -C #{dir} && rm #{dir}.tar.gz"
      else
        super
      end
    end
  end
end

