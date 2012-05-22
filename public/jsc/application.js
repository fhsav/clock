/* DO NOT MODIFY. This file was compiled Tue, 22 May 2012 00:47:57 GMT from
 * /var/www/fhsclock/app/assets/coffee/application.coffee
 */

(function() {
  var clock;

  (clock = function() {
    return setTimeout((function() {
      var am_pm, d, date, day, dayArray, hour, minute, month, monthArray, second, year;
      d = new Date();
      day = d.getDay();
      month = d.getMonth();
      date = d.getDate();
      year = d.getFullYear();
      hour = d.getHours();
      minute = d.getMinutes();
      second = d.getSeconds();
      dayArray = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
      monthArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      if (minute < 10) minute = "0" + minute;
      if (second < 10) second = "0" + second;
      if (hour >= 12) {
        am_pm = "PM";
      } else {
        am_pm = "AM";
      }
      hour = (hour > 12 ? hour - 12 : hour);
      hour = (hour === 0 ? 12 : hour);
      $("p#date").html(dayArray[day] + ", " + monthArray[month] + " " + date + ", " + year + "");
      $("p#time").html(hour + ":" + minute + ":" + second + " " + am_pm);
      return $(document).ready(function() {
        var final_period, final_time, time;
        final_period = $("ol#periods li:last-child");
        final_time = final_period.find("time.finish").attr("datetime") - 60;
        time = (d.getHours() * 3600) + (d.getMinutes() * 60);
        if (time > final_time) {
          $("ol#periods").css("display", "none");
          $("#left").removeClass("sevencol");
          $("#right").removeClass("fivecol").addClass("twelvecol");
          $("#date").css("font-size", "2.5em");
          $("#time").css("font-size", "4em");
        } else {
          $("ol#periods").css("display", "block");
          $("#left").addClass("sevencol");
          $("#right").removeClass("twelvecol").addClass("fivecol");
          $("#date").css("font-size", "1.75em");
          $("#time").css("font-size", "3em");
        }
        $("ol#periods li").each(function(index) {
          var e, finish, next, next_start, start;
          e = $(this);
          start = e.find("time.start").attr("datetime");
          finish = e.find("time.finish").attr("datetime");
          finish = finish - 60;
          time = (d.getHours() * 3600) + (d.getMinutes() * 60);
          if (time >= start && time <= finish) {
            e.attr("id", "active");
          } else {
            e.attr("id", "");
          }
          next = e.next();
          next_start = next.find("time.start").attr("datetime");
          if (time > finish) {
            return e.fadeOut('slow', function() {
              return e.hide();
            });
          }
        });
        return clock();
      });
    }), 0);
  })();

  $(document).ready(function() {
    var channel, pusher;
    $("#marquee").marquee({
      pauseOnHover: false
    });
    $('video[loop="loop"]').bind("ended", function() {
      return this.play();
    });
    pusher = new Pusher("4f803f0cec789e485391");
    channel = pusher.subscribe("refreshes");
    return channel.bind("refresh", function(data) {
      return window.location.href = window.location.href;
    });
  });

}).call(this);
