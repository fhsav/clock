class WallpaperUploader < CarrierWave::Uploader::Base
  storage :grid_fs
end
