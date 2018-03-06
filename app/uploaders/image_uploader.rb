class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [800, 800]

  version :small do
    process :resize_to_fill => [200, 200]
    process :quality => 100
  end

  version :medium do
    process :resize_to_fill => [400, 400]
    process :quality => 100
  end

  version :large do
    process :resize_to_fill => [700, 700]
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
