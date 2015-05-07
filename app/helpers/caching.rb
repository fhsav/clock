Clock::Web.helpers do
  def expire!(key)
    if Clock::Web.cache[key]
      expire(key)
    end
  end
end
