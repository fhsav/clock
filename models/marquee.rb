class Marquee
  include MongoMapper::Document
  
  key :text, String
  
  validates_presence_of :text

  before_save :format!

  private

  def format!
    self.text = self.text.squish
  end
end
