class Theme
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :active, :type => Boolean, :default => false
  field :wallpaper, :type => Hash

  validates_presence_of :name

  after_destroy :delete!

  def self.activated
    t = self.where(:active => true).first

    if t.nil?
      { :url => '/_/default.jpg', :type => 'image/jpeg' }
    else
      { :url => t.wallpaper[:url], :type => t.wallpaper[:type] }
    end
  end

  def video?
    r = false

    if wallpaper[:type] == 'video/mp4'
      r = true
    end

    r
  end
end
