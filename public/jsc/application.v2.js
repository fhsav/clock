/* DO NOT MODIFY. This file was compiled Wed, 08 Aug 2012 02:45:06 GMT from
 * /var/www/clock/app/assets/jsc/application.v2.coffee
 */

(function() {
  var Clock;

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

  setTimeout((function() {
    return Clock.update(new Date());
  }), 0);

  Clock = (function() {
    var afterschool, periods, timekeeping;
    var _this = this;

    function Clock() {}

    Clock.update = function(d) {
      this.d = d;
      timekeeping();
      periods();
      afterschool();
      return this.time = (this.d.getHours() * 3600) + (this.d.getMinutes() * 60) + this.d.getSeconds();
    };

    timekeeping = function() {
      var date, day, days, hour, minute, month, months, second, year;
      day = Clock.d.getDay();
      month = Clock.d.getMonth();
      date = Clock.d.getDate();
      year = Clock.d.getFullYear();
      hour = Clock.d.getHours();
      minute = Clock.d.getMinutes();
      second = Clock.d.getSeconds();
      days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
      months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      if (minute < 10) minute = "0" + minute;
      if (second < 10) second = "0" + second;
      hour = (hour > 12 ? hour - 12 : hour);
      hour = (hour === 0 ? 12 : hour);
      $("p#date").html("" + days[day] + ", " + months[month] + " " + date + ", " + year);
      return $("p#time").html("" + hour + ":" + minute + ":" + second);
    };

    periods = function() {
      return $(document).ready(function() {
        return $("ol#periods li").each(function(index) {
          var e, finish, start;
          e = $(this);
          start = e.find("time.start").attr("datetime");
          finish = e.find("time.finish").attr("datetime") - 60;
          if (this.time >= start && this.time <= finish) {
            e.addClass("active");
          } else {
            e.removeClass("active");
          }
          if (this.time >= finish) {
            return e.slideUp('slow', function() {
              return e.hide();
            });
          }
        });
      });
    };

    afterschool = function() {
      var final;
      final = $("ol#periods li:last-child").find("time.finish").attr("datetime") - 60;
      if (Clock.time > final) {
        $("ol#periods").hide();
        $("#left").removeClass("sevencol");
        $("#right").switchClass("fivecol", "twelvecol", 750);
        return $("#clock").switchClass("during", "after", 1000);
      } else {
        $("ol#periods").show();
        $("#left").addClass("sevencol");
        $("#right").switchClass("twelvecol", "fivecol", 750);
        return $("#clock").switchClass("after", "during", 1000);
      }
    };

    return Clock;

  }).call(this);

}).call(this);
