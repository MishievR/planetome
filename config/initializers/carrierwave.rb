CarrierWave.configure do |config|
  config.fog_credentials = {

      :provider                         => 'Google',
      :google_storage_access_key_id     => ENV['google_storage_access_key_id'],
      :google_storage_secret_access_key => ENV['google_storage_secret_access_key']



      }

  

      config.fog_directory = 'startups-space-images'

  # For testing, upload files to local `tmp` folder.



end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end
