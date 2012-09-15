(function() {
  var clock;

  (clock = function() {
    return setTimeout((function() {
      var d, date, day, days, hour, minute, month, months, ordinal, second, time, year;
      d = new Date();
      day = d.getDay();
      month = d.getMonth();
      date = d.getDate();
      year = d.getFullYear();
      hour = d.getHours();
      minute = d.getMinutes();
      second = d.getSeconds();
      days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
      months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      time = (hour * 3600) + (minute * 60) + second;
      if (minute < 10) {
        minute = "0" + minute;
      }
      if (second < 10) {
        second = "0" + second;
      }
      hour = (hour > 12 ? hour - 12 : hour);
      hour = (hour === 0 ? 12 : hour);
      date = "" + date;
      ordinal = function(d) {
        d = String(d);
        if (d.substr(-(Math.min(d.length, 2))) > 3 && d.substr(-(Math.min(d.length, 2))) < 21) {
          return "th";
        } else {
          return ["th", "st", "nd", "rd", "th"][Math.min(Number(d) % 10, 4)];
        }
      };
      $("p#date").html("" + days[day] + ", " + months[month] + " " + date + (ordinal(date)) + ", " + year);
      $("p#time").html("" + hour + ":" + minute + ":" + second);
      return $(document).ready(function() {
        var final;
        $("#periods ol li").each(function(index) {
          var e, finish, start;
          e = $(this);
          start = e.find("time.start").attr("datetime");
          finish = e.find("time.finish").attr("datetime");
          if (time >= start && time <= finish) {
            e.addClass("active");
          } else {
            e.removeClass("active");
          }
          if (time > finish && time < e.next().find("time.start").attr("datetime")) {
            e.css("border-bottom", "10px solid rgba(0, 0, 0, 0.5)");
          } else {
            e.css("border-bottom", "1px solid rgba(0, 0, 0, 0.5)");
          }
          if (time >= finish && $("#periods ol li").size() > 10) {
            return e.slideUp('slow', function() {
              return e.hide();
            });
          }
        });
        final = $("#periods ol li:last-child").find("time.finish").attr("datetime");
        if (time > final || $("#main").hasClass("true")) {
          $("#main").addClass("after");
        } else {
          $("#main").removeClass("after");
        }
        return clock();
      });
    }), 0);
  })();

  $(document).ready(function() {
    var faye, refreshes;
    $("#marquee ul").marquee({
      pauseOnHover: false
    });
    faye = new Faye.Client("http://localhost:5000/faye");
    return refreshes = faye.subscribe("/refreshes", function(message) {
      return location.reload(false);
    });
  });

}).call(this);
