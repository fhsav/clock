require 'pony'

Pony.mail(
	:to => "Ethan Turkeltaub <ethan.turkeltaub@gmail.com>",
	:from => "FHS Timelord <fhsclock@gmail.com>",
	:subject => "FHS Clock build failed!",
	:body => "The latest build of the FHS Clock failed. Please check it out!",
	
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

Pony.mail(
	:to => "Evan Foreman <fhsav@comcast.net>",
	:from => "FHS Timelord <fhsclock@gmail.com>",
	:subject => "FHS Clock build failed!",
	:body => "The latest build of the FHS Clock failed. Please check it out!",
	
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
