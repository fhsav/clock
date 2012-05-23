# FHS Clock
#   file: application.coffee

$(document).ready ->
  $("#marquee").marquee pauseOnHover: false
  
  $('video[loop="loop"]').bind "ended", ->
    @play()
    
  pusher = new Pusher("4f803f0cec789e485391")
  channel = pusher.subscribe("refreshes")
  channel.bind "refresh", (data) ->
    window.location.href = window.location.href

setTimeout (->
  Clock.update(new Date())
), 0

class Clock
  constructor: ->
  @update: (d) ->
    timekeeping()
    periods()
    afterschool()


  timekeeping = ->
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

    $("p#date").html "#{days[day]}, #{months[month]} #{date}#{ordinal(date)}, #{year}"
    $("p#time").html "#{hour}:#{minute}:#{second}"


  periods = ->
    $(document).ready ->
      $("ol#periods li").each (index) ->
        e = $(@)
        
        start = e.find("time.start").attr("datetime")
        finish = e.find("time.finish").attr("datetime") - 60

        if time >= start and time <= finish
          e.addClass "active"
        else
          e.removeClass "active"

        if time => finish
          e.slideUp 'slow', ->
            e.hide()


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