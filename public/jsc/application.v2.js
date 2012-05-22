/* DO NOT MODIFY. This file was compiled Tue, 22 May 2012 23:33:25 GMT from
 * /var/www/fhsclock/app/assets/coffee/application.v2.coffee
 */

(function() {
  var Clock;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, _this = this;

  Clock = (function() {

    function Clock() {
      this.afterschool = __bind(this.afterschool, this);
      this.highlight = __bind(this.highlight, this);
      this.time = __bind(this.time, this);
      this.currentTime = __bind(this.currentTime, this);
      this.currentDate = __bind(this.currentDate, this);
      this.clock = __bind(this.clock, this);
      this.update = __bind(this.update, this);      this.d = new Date();
    }

    Clock.prototype.update = function() {
      this.clock();
      this.highlight();
      return this.afterschool();
    };

    Clock.prototype.clock = function() {
      $("p#date").html(this.currentDate());
      return $("p#time").html(this.currentTime());
    };

    Clock.prototype.currentDate = function() {
      var date, day, days, month, months, year;
      days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
      months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      day = this.d.getDay();
      month = this.d.getMonth();
      date = this.d.getDate();
      year = this.d.getFullYear();
      return "" + days[day] + ", " + months[month] + " " + date + ", " + year;
    };

    Clock.prototype.currentTime = function() {
      var hour, minute, second;
      hour = this.d.getHours();
      minute = this.d.getMinutes();
      second = this.d.getSeconds();
      if (minute < 10) minute = "0" + minute;
      if (second < 10) second = "0" + second;
      if (hour > 12) {
        hour = hour - 12;
      } else if (hour === 0) {
        hour = 12;
      } else {
        hour = hour;
      }
      return "" + hour + ":" + minute + ":" + second;
    };

    Clock.prototype.time = function() {
      return (this.d.getHours() * 3600) + (this.d.getMinutes() * 60) + this.d.getSeconds();
    };

    Clock.prototype.highlight = function() {
      var _this = this;
      return $("ol#periods li").each(function(index) {
        var e, finish, start;
        e = $(_this);
        start = e.find("time.start").attr("datetime");
        finish = e.find("time.finish").attr("datetime") - 60;
        if (time >= start && time <= finish) {
          e.switchClass("", "active", 1000);
        } else {
          e.switchClass("active", "", 1000);
        }
        if (time > finish) {
          return e.delay(500).slideUp("slow", function() {
            return e.detach;
          });
        }
      });
    };

    Clock.prototype.afterschool = function() {};

    return Clock;

  })();

  setTimeout((function() {
    var fhs;
    fhs = new Clock();
    return fhs.update();
  }), 0);

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
