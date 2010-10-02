### Clock.
###   file: app/helpers/helpers.rb

helpers do
  def login_required
    if session["fhsclock"] != 1
      redirect '/login'
    end    
  end
end
