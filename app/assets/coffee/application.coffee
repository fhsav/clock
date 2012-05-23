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
      periods = ->
        $("ol#periods li").each (index) ->
          e = $(this)
          
          start = e.find("time.start").attr("datetime")
          finish = e.find("time.finish").attr("datetime") - 60

          if time >= start and time <= finish
            e.addClass "active"
          else
            e.removeClass "active"

          if time => finish
            e.slideUp 'slow', ->
              e.hide()

      # Check if it's after school and respond appropriately.
      afterschool = ->
        final = $("ol#periods li:last-child").find("time.finish").attr("datetime") - 60

        if time > final
          $("ol#periods").hide()
          $("#left").removeClass("sevencol")
          $("#right").switchClass "fivecol", "twelvecol", 750
          $("#clock").switchClass "during", "after", 1000
        else
          $("ol#periods").show()
          $("#left").addClass "sevencol"
          $("#right").switchClass "twelvecol", "fivecol", 750
          $("#clock").switchClass "after", "during", 1000
      
        periods()
        afterschool()
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
