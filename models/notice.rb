class Notice
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, :type => String

  validates_presence_of :text

  before_save :format

  private

  def format
    self.text = self.text.squish
  end
end
