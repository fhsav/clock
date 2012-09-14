# Clock
#   file: clock.coffee

(clock = ->
  setTimeout (->
    d = new Date()
    day = d.getDay()
    month = d.getMonth()
    date = d.getDate()
    year = d.getFullYear()
    hour = d.getHours()
    minute = d.getMinutes()
    second = d.getSeconds()
    
    days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    time = (hour * 3600) + (minute * 60) + second

    minute = "0" + minute if minute < 10
    second = "0" + second if second < 10
    
    hour = (if (hour > 12) then hour - 12 else hour)
    hour = (if (hour is 0) then 12 else hour)

    date = "#{date}"

    ordinal = (d) ->
      d = String(d)
      (if d.substr(-(Math.min(d.length, 2))) > 3 and d.substr(-(Math.min(d.length, 2))) < 21 then "th" else [ "th", "st", "nd", "rd", "th" ][Math.min(Number(d) % 10, 4)])
    
    # Append date and time to clock.
    $("p#date").html "#{days[day]}, #{months[month]} #{date}#{ordinal(date)}, #{year}"
    $("p#time").html "#{hour}:#{minute}:#{second}"
    
    $(document).ready ->

      # Check what period it is and respond appropriately.
      $("#periods ol li").each (index) ->
        e = $(@)

        start = e.find("time.start").attr("datetime")
        finish = e.find("time.finish").attr("datetime")

        if time >= start and time <= finish
          e.addClass "active"
        else
          e.removeClass "active"

        if time > finish and time < e.next().find("time.start").attr("datetime")
          e.css "border-bottom", "10px solid rgba(0, 0, 0, 0.5)"
        else
          e.css "border-bottom", "1px solid rgba(0, 0, 0, 0.5)"

        if time >= finish and $("#periods ol li").size() > 10
          e.slideUp 'slow', ->
            e.hide()

      # Check if it's after school and respond appropriately.
      final = $("#periods ol li:last-child").find("time.finish").attr("datetime")

      # Check if schedule exists.
      if time > final or $("#main").hasClass "true"
        $("#main").addClass "after"
      else
        $("#main").removeClass "after"

      clock()
  ), 0
)()

$(document).ready ->

  # Marquee
  $("#marquee ul").marquee pauseOnHover: false

  # Faye (Refreshing)
  faye = new Faye.Client("http://localhost:5000/faye")
  refreshes = faye.subscribe("/refreshes", (message) ->
    location.reload false
  )