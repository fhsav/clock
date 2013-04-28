Clock::Web.helpers do
  def expire!(key)
    if Clock::Web.cache.get(key)
      expire(key)
    end
  end
end
