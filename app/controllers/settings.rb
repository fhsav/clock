Clock.controllers :settings do
  before :except => :setup do
    redirect!

    @settings = {
      "password" => Redis.get("password")
    }
  end

  get :setup, :map => "/setup" do
    Redis.set("password", encrypt("shrugav"))

    redirect url(:sessions, :new)
  end
end