class Theme
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::MassAssignmentSecurity

  attr_accessible :wallpaper, :wallpaper_cache

  field :name, :type => String
  field :active, :type => Boolean, :default => false

  validates_presence_of :name

  mount_uploader :wallpaper, WallpaperUploader

  def self.activated
    where(:active => true).first
  end

  def activate!
    self.class.all.set(:active => false)
    self.active = true
    self.save
  end

  def video?
    self.wallpaper.file.content_type == 'application/mp4'
  end
end
