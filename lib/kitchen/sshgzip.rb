require 'kitchen'
require 'kitchen/sshgzip/version'
require 'tmpdir'

module Kitchen
  class GzippedChefDataUploader < ChefDataUploader
    def upload_path(scp, path, dir = File.basename(path))
      if File.directory?(path)
        tmp_root = Dir.mktmpdir('gzipped_chef_upload')
        gzip_path = "#{tmp_root}/#{dir}.tar.gz"
        info("Compressing #{dir} into #{dir}.tar.gz")
        system "cd #{path} && tar -zcf #{gzip_path} ."
        upload_size = File.size(gzip_path)
        info("Uploading #{dir}.tar.gz (#{upload_size} bytes)")
        super(scp, gzip_path, "#{dir}.tar.gz")
        info("Unpacking #{dir}.tar.gz on the client")
        scp.session.exec! "cd #{chef_home} && mkdir #{dir} && " +
          "tar -zxf #{dir}.tar.gz -C #{dir} && rm #{dir}.tar.gz"
      else
        super
      end
    end
  end
end

