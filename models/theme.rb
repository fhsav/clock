class Theme
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessible :wallpaper, :wallpaper_cache

  field :name, :type => String
  field :active, :type => Boolean, :default => false

  validates_presence_of :name

  mount_uploader :wallpaper, WallpaperUploader

  def video?
    self.wallpaper.file.content_type == 'video/mp4'
  end
end
