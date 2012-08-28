(function() {

  $(document).ready(function() {
    var faye, refreshes;
    $("#marquee ul").marquee({
      pauseOnHover: false
    });
    faye = new Faye.Client("http://localhost:5000/faye");
    return refreshes = faye.subscribe("/refreshes", function(message) {
      window.location = window.location;
      console.log(message.timestamp);
      return $("p#time").css("color", "red");
    });
  });

}).call(this);
