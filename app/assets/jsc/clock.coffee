$(document).ready ->
  $("#marquee ul").marquee pauseOnHover: false

  faye = new Faye.Client("http://localhost:5000/faye")
  refreshes = faye.subscribe("/refreshes", (message) ->
    window.location = window.location
    console.log message.timestamp
    $("p#time").css "color", "red"
  )