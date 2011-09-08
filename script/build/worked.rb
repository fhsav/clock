require 'gmail'

Gmail.new("fhsclock", "shrug#cl*ck") do |gmail|
  gmail.deliver do
    to "ethan.turkeltaub@gmail.com"
    subject "FHS Clock build is a success!"
    text_part do
      body "The build of the latest stable version of the FHS Clock has succeeded!"
    end
  end
  
  gmail.deliver do
    to "fhsav@comcast.net"
    subject "FHS Clock build is a success!"
    text_part do
      body "The build of the latest stable version of the FHS Clock has succeeded!"
    end
  end
end
