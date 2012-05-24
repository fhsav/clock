# FHS Clock
#   file: application.coffee

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
      $("ol#periods li").each (index) ->
        e = $(@)

        start = e.find("time.start").attr("datetime")
        finish = e.find("time.finish").attr("datetime")

        if time >= start and time <= finish
          e.addClass "active"
        else
          e.removeClass "active"

        if time >= finish
          e.attr 'data', '-1'

          e.slideUp 'slow', ->
            e.hide()

      # Check if it's after school and respond appropriately.
      final = $("ol#periods li:last-child").find("time.finish").attr("datetime")

      if time > final
        $("ol#periods").css "display", "none"
        $("#left").removeClass("sevencol")
        $("#right").removeClass("fivecol").addClass "twelvecol"
        $("#date").css("font-size", "2.5em")
        $("#time").css("font-size", "4em")
      else
        $("ol#periods").css "display", "block"
        $("#left").addClass "sevencol"
        $("#right").removeClass("twelvecol").addClass "fivecol"
        $("#date").css("font-size", "2.25em")
        $("#time").css("font-size", "3.5em")

      clock()
  ), 0
)()

$(document).ready ->
  $("#marquee").marquee pauseOnHover: false
  
  $('video[loop="loop"]').bind "ended", ->
    @play()
    
  pusher = new Pusher("4f803f0cec789e485391")
  channel = pusher.subscribe("refreshes")
  channel.bind "refresh", (data) ->
    window.location.href = window.location.href;
