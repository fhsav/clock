/* DO NOT MODIFY. This file was compiled Sat, 19 Nov 2011 00:10:51 GMT from
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
      dayArray = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
      monthArray = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
      if (date < 10) date = "0" + date;
      if (hour >= 12) {
        am_pm = "PM";
      } else {
        if (hour < 12) am_pm = "AM";
      }
      if (minute < 10) minute = "0" + minute;
      if (second < 10) second = "0" + second;
      hour = (hour > 12 ? hour - 12 : hour);
      hour = (hour === 0 ? 12 : hour);
      $("p#date").html(dayArray[day] + ", " + monthArray[month] + " " + date + ", " + year + "");
      $("p#time").html(hour + ":" + minute + ":" + second + " " + am_pm);
      return $(document).ready(function() {
        var final_period, final_time, time;
        final_period = $("ol#periods li:last-child");
        final_time = final_period.find("time.finish").attr("datetime");
        d = new Date();
        time = (d.getHours() * 3600) + (d.getMinutes() * 60);
        if (final_time < time || $("ol#periods:empty")) {
          $("#after").css("display", "block");
          $("ol#periods").css("display", "none");
          $("#left").removeClass("sevencol");
          $("#right").removeClass("fivecol").addClass("twelvecol");
          $("#clock #date").css("font-size", "2.75em");
          $("#clock #time").css("font-size", "4em");
        } else {
          $("ol#periods").css("display", "block");
          $("#after").css("display", "none");
          $("#left").removeClass("fivecol").addClass("sevencol");
          $("#right").removeClass("twelvecol").addClass("fivecol");
        }
        $("ol#periods li").each(function(index) {
          var element, finish, next, next_start, start;
          element = $(this);
          start = element.find("time.start").attr("datetime");
          finish = element.find("time.finish").attr("datetime");
          finish = finish - 60;
          time = (d.getHours() * 3600) + (d.getMinutes() * 60);
          if (time >= start && time <= finish) {
            element.attr("id", "active");
          } else {
            element.attr("id", "");
          }
          next = element.next();
          next_start = next.find("time.start").attr("datetime");
          next_start = next_start;
          if (time > finish && time < next_start) {
            return element.css("border-bottom", "10px solid #000");
          } else {
            return element.css("border-bottom", "1px solid #000");
          }
        });
        return clock();
      });
    }), 0);
  })();

  $(document).ready(function() {
    $("#marquee").marquee({
      pauseOnHover: false
    });
    $("video[loop]").bind("ended", function() {
      return this.play();
    });
    return $("ol#periods li").fitText(1.2, {
      minFontSize: "30px",
      maxFontSize: "36px"
    });
  });

}).call(this);
