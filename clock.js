function Clock () {
}

Function.prototype.myBind = function(context) {
  var fn = this;
  function fun() {
    fn.apply(context);
  }
  return fun
}


Clock.TICK = 5000;

Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS
  console.log(this.date.getHours() + ":" + this.date.getMinutes() + ":" + this.date.getSeconds());
};

Clock.prototype.run = function () {
  // 1. Set the currentTime.
  // 2. Call printTime.
  // 3. Schedule the tick interval.
  this.date = new Date();
  this.printTime();
  setInterval(this._tick.myBind(this), Clock.TICK);
};

Clock.prototype._tick = function () {
  // 1. Increment the currentTime.
  // 2. Call printTime.
  var seconds = (this.date.getSeconds() + 5);
  if (seconds < 60) {
    this.date.setSeconds(seconds);
  } else {
    var minutes = (this.date.getMinutes() + 1);
    this.date.setSeconds(seconds - 60);
    if (minutes < 60) {
      this.date.setMinutes(minutes);
    } else {
      this.date.setMinutes(minutes - 60);
      var hours = (this.date.getHours() + 1);
      if (hours < 24) {
        this.date.setHours(hours);
      } else {
        this.date.setHours(hours - 24);
      }
    }
  }

  this.printTime();
};

var clock = new Clock();
// clock.run();
clock.run()
