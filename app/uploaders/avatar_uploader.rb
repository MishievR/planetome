class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick



  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "uploads/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    # process :crop
    process resize_to_fill: [50, 50]
    process :quality => 100
  end

  version :small do
    process :resize_to_fill => [100, 100]
    process :quality => 100
  end

  version :medium do
    process :resize_to_fill => [200, 200]
    process :quality => 100
  end

  version :large do
    process :resize_to_fill => [600, 600]
    process :quality => 100
  end

  # def crop
  #   if model.crop_x.present?
  #     resize_to_limit(600, 600)
  #     manipulate! do |img|
  #       x = model.crop_x.to_i
  #       y = model.crop_y.to_i
  #       w = model.crop_w.to_i
  #       h = model.crop_h.to_i
  #       img.crop([[w, h].join('x'),[x, y].join('+')].join('+'))
  #     end
  #   end
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end


  def fix_exif_rotation #this is my attempted solution
  manipulate! do |img|
    img.tap(&:auto_orient)
  end
end

process :fix_exif_rotation

end
