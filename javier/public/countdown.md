# Cuenta atrás

Script que calcula la cuenta atrás hasta la finalización del curso

```javascript

function timeDiff(date1, date2){
    var now, day, month, year, sortDates;

    var dates = [],
        milliseconds = [];

    var timeDiff = {};

    //if only passed 1 argument, use as initial date current date
    if( arguments.length === 1 ){
        now = new Date();
        now = now.getDate()+'-'+(now.getMonth()+1)+'-'+now.getFullYear()+' '+now.getHours()+':'+now.getMinutes()+':'+now.getSeconds();
        dates.push(now, date1);
    }
    else{
        dates.push(date1, date2);        
    }      

    for(var i=0; i < dates.length; i++){
        dateFormat = dates[i].split("-"),
        year = dateFormat[2].split(" ").shift() || dateFormat[2],
        month = dateFormat[1],
        day = dateFormat[0];

        //check if time has been given and if so, split it
        if (dates[i].split(' ').length === 2){
            time = dates[i].split(" ")[1];
        }
        if (dates[i].split(' ').length === 1){
            time = '00:00:00';
        }

        //time with 2 digits
        time = time.split(':')
        hours = time[0] < 10 ? 0+time[0] : time[0],
        minutes = time[1] < 10 ? 0+time[1] : time[1],
        seconds = time[2] < 10 ? 0+time[2] : time[2];

        //generate timestamp from each date & save it to milliseconds array
        formatedDate = new Date(year, month, day, hours, minutes, seconds);
        dateMilliseconds = formatedDate.getTime();
        timestamp = Math.round(dateMilliseconds);
        milliseconds.push(timestamp);
    }    

    sortDates = milliseconds.sort(function(a, b){ return a-b });
    millisecondsDiff = (milliseconds[1]-milliseconds[0]) / 1000;
    timeDiff = {'date1':dates[0], 'date2':dates[1], 'msinitial':milliseconds[0], 'msfinal':milliseconds[1], 'msdiff':millisecondsDiff};
    
    return timeDiff;

}
timeDiff('28-7-2016 21:59:59');//Object {date1: "23-7-2016 23:12:14", date2: "28-7-2016 21:59:59", msinitial: 1471986734000, msfinal: 1472414399000, msdiff: 4276650}

function millisecondsToTimeUnits(ms) {
  var ms2secs, ms2minutes, ms2hours, ms2days, ms2weeks, ms2months, ms2myears;
  var timeUnits = {};

  ms2secs = (Math.floor(ms));
  ms2minutes = (Math.floor(ms2secs / 60));
  ms2hours = (Math.floor(ms2minutes / 60));
  ms2days = Math.floor(ms2hours / 24);
  ms2weeks = Math.floor(ms2days / 7);
  ms2months = Math.floor(ms2weeks / 4);
  ms2years = Math.floor(ms2months / 12);

  years = ms2years;
  months = ms2months % 12;
  weeks = ms2weeks % 4;
  days = ms2days % 7;
  hours = ms2hours % 24;
  minutes = ms2minutes % 60;
  seconds = ms2secs % 60;

  timeUnits = {'years':years, 'months':months, 'weeks':weeks, 'days':days, 'hours':hours, 'minutes':minutes, 'seconds':seconds};
  for(var i=0; i < timeUnits.length; i++){
    if(timeUnits[i] < 10){
      timeUnits[i] = '0'+timeUnits[i];
    }
  }

  return timeUnits;
};
//millisecondsToTimeUnits(425940);//Object {years: 0, months: 0, weeks: 0, days: 4, hours: 22, minutes: 19, seconds: 0}
millisecondsToTimeUnits(timeDiff('28-7-2016 21:59:59').msdiff);


var countDown = setInterval(function(){
    var deadlineMilliseconds = timeDiff('28-7-2016 21:59:59').msdiff;
    var deadline = millisecondsToTimeUnits(deadlineMilliseconds);
    
    var days = deadline.days;
    var hours = deadline.hours;
    var minutes = deadline.minutes;
    var seconds = deadline.seconds;

    if (days < 10){
        days = '0'+days;
    }
    if (hours < 10){
        hours = '0'+hours;
    }
    if (minutes < 10){
        minutes = '0'+minutes;
    }
    if (seconds < 10){
        seconds = '0'+seconds;
    }           

    document.body.innerHTML = days+':'+hours+':'+minutes+':'+seconds;
    
    if(deadlineMilliseconds<=0){
        clearInterval(countDown);
    }

},1000);    


```
