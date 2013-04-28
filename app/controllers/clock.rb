Clock::Web.controllers :clock do
  get :index do
    @main = cache('active_main', :expires_in => 86400) do
      @s = Schedule.activated
      @n = Notice.sort(:updated_at)

      partial 'clock/main'
    end

    @theme = Theme.activated

    @marquees = cache('active_marquees', :expires_in => 86400) do
      @m = Marquee.sort(:updated_at)

      partial 'clock/marquees'
    end

    render 'clock/index', :layout => false
  end
end
