function CountingMinutesI(str) {
  times = str.split('-');
  for(var i = 0; i < times.length; i++) {
    var minutes = 0;
    if (times[i].slice(-2) === 'pm') {
      minutes += (12 * 60);
    }
    times[i] = times[i].slice(0, -2).split(':');
    if (times[i][0] !== "12") {
      minutes += parseInt(times[i][0]) * 60;
    }

    minutes += parseInt(times[i][1]);
    times[i] = minutes;
  }
  if (times[0] < times[1]) {
    str = times[1] - times[0];
  } else {
    str = ((24 * 60) - times[0]) + times[1];
  }
  // code goes here
  return str;
}


console.log(CountingMinutesI("12:30pm-12:00am"))
console.log(CountingMinutesI("1:23am-1:08am"))
