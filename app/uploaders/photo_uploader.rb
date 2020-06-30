class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # Include CarrierWave::Rmagick
  include CarrierWave::MiniMagick

  # Include the Sprockets helper for Rails 3.1+ asset pipeline compatibility:
  # Include Sprockets::Helpers::RailsHelper
  # Include Sprockets::Helpers::IsolatedHelper

  # Include the sprockets-rails helper for Rails 4+ asset pipeline compatibility:
  include Sprockets::Rails::Helper

  # Choose what kind of storage we want to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :tiny do
    process :resize_to_fill => [20, 20]
  end

  version :profile_size do
    process :resize_to_fill => [128, 128]
  end

  # Add a white list of extension which are allowed for upload
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
