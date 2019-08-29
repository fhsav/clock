Clock::Web.helpers do

  # Converts Time object to seconds.
  def seconds(time)
    ((time.hour * 3600) + (time.min * 60)).to_i
  end

  # Format the time in 12- or 24-hour time.
  def time(time, convention = 24)
    case convention
    when 24
      time.strftime("%H:%M")
    when 12
      time.strftime("%l:%M").strip
    else
      time
    end
  end

  # Is this string a time?
  def time?(str)
    str.to_s.match(/^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$/)
  end
end
