/* DO NOT MODIFY. This file was compiled Wed, 23 May 2012 12:11:27 GMT from
 * /Users/fhsteacher/Sites/fhsclock/app/assets/coffee/application.coffee
 */

(function() {
  var clock;

  (clock = function() {
    return setTimeout((function() {
      var d, date, day, dayLastNum, days, hour, minute, month, months, second, suffix, time, year;
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
      time = (d.getHours() * 3600) + (d.getMinutes() * 60);
      if (minute < 10) minute = "0" + minute;
      if (second < 10) second = "0" + second;
      hour = (hour > 12 ? hour - 12 : hour);
      hour = (hour === 0 ? 12 : hour);
      date = "" + date;
      dayLastNum = date.substr(1, date.length);
      if (dayLastNum === "1") {
        suffix = "st";
      } else if (dayLastNum === "2") {
        suffix = "nd";
      } else if (dayLastNum === "3") {
        suffix = "rd";
      } else {
        suffix = "th";
      }
      $("p#date").html("" + days[day] + ", " + months[month] + " " + date + suffix + ", " + year);
      $("p#time").html("" + hour + ":" + minute + ":" + second);
      return $(document).ready(function() {
        var final;
        final = $("ol#periods li:last-child").find("time.finish").attr("datetime") - 60;
        if (time > final) {
          $("ol#periods").hide();
          $("#left").removeClass("sevencol");
          $("#right").switchClass("fivecol", "twelvecol", 750);
          $("#clock").switchClass("during", "after", 1000);
        } else {
          $("ol#periods").show();
          $("#left").addClass("sevencol");
          $("#right").switchClass("twelvecol", "fivecol", 750);
          $("#clock").switchClass("after", "during", 1000);
        }
        $("ol#periods li").each(function(index) {
          var e, finish, next, start;
          e = $(this);
          start = e.find("time.start").attr("datetime");
          finish = e.find("time.finish").attr("datetime") - 60;
          if (time >= start && time <= finish) {
            e.addClass("active");
          } else {
            e.removeClass("active");
          }
          next = e.next().find("time.start").attr("datetime");
          if (time > finish) {
            return e.slideUp('slow', function() {
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
