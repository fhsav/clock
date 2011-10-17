require 'pony'

Pony.mail(
	:to => "Ethan Turkeltaub <ethan.turkeltaub@gmail.com>",
	:from => "FHS Timelord <fhsclock@gmail.com>",
	:subject => "FHS Clock build succeeded!",
	:body => "The latest build of the FHS Clock has succeeded! The clock has now been updated. The public-facing clock will need refreshing.",
	
	:via => :smtp, :smtp => {
		:host => 'smtp.gmail.com',
		:port => '587',
		:user => 'fhsclock@gmail.com',
		:password => 'shrug#cl*ck',
		:auth => :plain,
		:domain => "gmail.com"
	},
	
	:headers => {
		"Reply-To" => "fhsclock@gmail.com"
	}
)
