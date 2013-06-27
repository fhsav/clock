(function() {
  var Clock;

  Clock = (function() {
    function Clock(time) {
      var adjusted_minute, adjusted_second, months, time_in_seconds;

      ({
        days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
      });
      months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      if (time.getMinutes() < 10) {
        adjusted_minute = "0" + time.getMinutes();
      }
      if (time.getSeconds() < 10) {
        adjusted_second = "0" + time.getSeconds();
      }
      time_in_seconds = (time.getHours() * 3600) + (time.getMinutes() * 60) + time.getSeconds();
      this.time = {
        day: days[time.getDay()],
        month: months[time.getMonth()],
        date: time.getDate(),
        year: time.getFullYear(),
        hour: time.getHours(),
        minute: adjusted_minute,
        second: adjusted_second,
        in_seconds: time_in_seconds
      };
      console.log(this.time);
    }

    Clock.prototype.clock = function() {
      $("p#date").html("" + this.time.day + ", " + this.time.month + " " + this.time.date + ", " + this.time.year);
      return $("p#time").html("" + this.time.hour + ":" + this.time.minute + ":" + this.time.second);
    };

    Clock.prototype.highlighter = function() {};

    Clock.prototype.after = function() {};

    return Clock;

  })();

  setInterval((function() {
    return new Clock(new Date());
  }), 60000);

}).call(this);
