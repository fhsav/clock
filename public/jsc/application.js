/* DO NOT MODIFY. This file was compiled Wed, 08 Aug 2012 02:45:06 GMT from
 * /var/www/clock/app/assets/jsc/application.coffee
 */

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
      if (minute < 10) minute = "0" + minute;
      if (second < 10) second = "0" + second;
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
        $("ol#periods li").each(function(index) {
          var e, finish, start;
          e = $(this);
          start = e.find("time.start").attr("datetime");
          finish = e.find("time.finish").attr("datetime");
          if (time >= start && time <= finish) {
            e.attr("id", "active");
          } else {
            e.attr("id", "");
          }
          if (time > finish && time < e.next().find("time.start").attr("datetime")) {
            e.css("border-bottom", "10px solid rgba(0, 0, 0, 0.5)");
          } else {
            e.css("border-bottom", "1px solid rgba(0, 0, 0, 0.5)");
          }
          if (time >= finish && $("ol#periods li").size() > 10) {
            e.attr('data', '-1');
            return e.slideUp('slow', function() {
              return e.hide();
            });
          }
        });
        final = $("ol#periods li:last-child").find("time.finish").attr("datetime");
        if (time > final) {
          $("ol#periods").css("display", "none");
          $("#left").removeClass("sevencol");
          $("#right").removeClass("fivecol").addClass("twelvecol");
          $("#date").css("font-size", "2.5em");
          $("#time").css("font-size", "4.15em");
        } else {
          $("ol#periods").css("display", "block");
          $("#left").addClass("sevencol");
          $("#right").removeClass("twelvecol").addClass("fivecol");
          $("#date").css("font-size", "2em");
          $("#time").css("font-size", "3.5em");
        }
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
