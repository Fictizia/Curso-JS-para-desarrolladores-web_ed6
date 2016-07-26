# El tiempo meteorológico API

Sacar en el html el tiempo meteorológico 
[Online version](http://jgarciaruiz.es/weatherapp/)

JS
```javascript
var settings;
var token = '';

var app = {
  settings: {
    apiurl: 'http://api.openweathermap.org/data/2.5/forecast?lang=es&units=metric&forecast&appid='+token
  },  
  init: function(location) {
    locateMe = location;

    //console.log(app.actions.geolocation());//NO FUNCIONA

    //var city = 'madrid';
    //var url = app.settings.apiurl+'&q='+city;

    var lat = locateMe.latitude;
    var lon = locateMe.longitude;
    
    var url = app.settings.apiurl+'&lat='+lat+'&lon='+lon;

    var dayNow, timenow, iconSrc, cod, clouds, latitude, longitude, humidity, pressure, temp, temp_max, temp_min, place, sunrise, sunset, weatherDesc, weatherId, windDeg, windSpeed;

    var xmlHttp = new XMLHttpRequest();

    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState === 4 && xmlHttp.status >= 200 && xmlHttp.status <= 400) {
            var data = JSON.parse(xmlHttp.responseText);
            //ajax result
            console.info(data);
            cod = data.cod,
            city = data.city.name,
            latitude = data.city.coord.lat,
            longitude = data.city.coord.lon,            

            console.groupCollapsed('Weather data');
            console.log('cod: '+cod+'\nclouds: '+clouds+'\nlatitude: '+latitude+'\nlongitude: '+longitude+'\nhumidity: '+humidity+'\npressure: '+pressure+'\ntemp: '+temp+'\ntemp_max: '+temp_max+'\ntemp_min: '+temp_min+'\nplace: '+place+'\nsunrise: '+sunrise+'\nsunset: '+sunset+'\nweatherDesc: '+weatherDesc+'\nweatherId: '+weatherId+'\nwindSpeed: '+windSpeed+'\n');
            console.groupEnd();

        
            //today weather data
            dayNow = new Date();
        timeNow = dayNow.toLocaleString('es-ES', { hour:'2-digit', minute:'2-digit', second:'2-digit', hour12:false });
        timestampSeconds = Math.round(Date.now() / 1000);

        //following 4 days weather data
        var todayPlus24h = Math.round( new Date().setDate(new Date().getDate() + 1) / 1000);
        var todayPlus48h = Math.round( new Date().setDate(new Date().getDate() + 2) / 1000);
        var todayPlus72h = Math.round( new Date().setDate(new Date().getDate() + 3) / 1000);
        var todayPlus96h = Math.round( new Date().setDate(new Date().getDate() + 4) / 1000);
        
        for(i=0; i < data.list.length; i++){
          if( timestampSeconds < data.list[i].dt ){
            //console.log('now',timestampSeconds);
            //console.log('wts', data.list[i].dt);

                weatherCode = data.list[i].weather[0].id,
                clouds = data.list[i].clouds.all,
                humidity = data.list[i].main.humidity,
                pressure = data.list[i].main.pressure,
                temp = data.list[i].main.temp,
                temp_max = data.list[i].main.temp_max,
                temp_min = data.list[i].main.temp_min,
                sunrise = data.list[i].sys.sunrise,
                sunset = data.list[i].sys.sunset,
                weatherDesc = data.list[i].weather[0].description,
                weatherId = data.list[i].weather[0].id,
                windSpeed = data.list[i].wind.speed;

                break;
          }

        }

        //dynamic 5 days of the week
        document.querySelector('.days li:nth-child(1) .weekday').innerHTML = 'Hoy';
        document.querySelector('.days li:nth-child(2) .weekday').innerHTML = app.actions.weekDay(1);
        document.querySelector('.days li:nth-child(3) .weekday').innerHTML = app.actions.weekDay(2);
        document.querySelector('.days li:nth-child(4) .weekday').innerHTML = app.actions.weekDay(3);
        document.querySelector('.days li:nth-child(5) .weekday').innerHTML = app.actions.weekDay(4);

        //today (bottom li)
        document.querySelector('.days li:nth-child(1) .icon').src=app.actions.weatherIcon(weatherCode);
        document.querySelector('.days li:nth-child(1) .mintemp').innerHTML = temp_min;
        document.querySelector('.days li:nth-child(1) .maxtemp').innerHTML = temp_max;        

        //tomorrow data
        //console.log('tomorrow: '+todayPlus24h);
        for(i=0; i < data.list.length; i++){
          if(todayPlus24h > data.list[i].dt){
            icon = app.actions.weatherIcon(data.list[i].weather[0].id);
            mintemp = data.list[i].main.temp_min;
            maxtemp = data.list[i].main.temp_max;

            document.querySelector('.days li:nth-child(2) .icon').src = icon;
            document.querySelector('.days li:nth-child(2) .mintemp').innerHTML = mintemp;
            document.querySelector('.days li:nth-child(2) .maxtemp').innerHTML = maxtemp;
          }
        }       

        //data after tomorrow
        //console.log('after tomorrow: '+todayPlus48h);       
        for(i=0; i < data.list.length; i++){
          if(todayPlus48h > data.list[i].dt){
            icon = app.actions.weatherIcon(data.list[i].weather[0].id);
            mintemp = data.list[i].main.temp_min;
            maxtemp = data.list[i].main.temp_max;

            document.querySelector('.days li:nth-child(3) .icon').src = icon;
            document.querySelector('.days li:nth-child(3) .mintemp').innerHTML = mintemp;
            document.querySelector('.days li:nth-child(3) .maxtemp').innerHTML = maxtemp;
          }
        }

        //data in 4 days
        //console.log('in 4 days: '+todayPlus72h);        
        for(i=0; i < data.list.length; i++){
          if(todayPlus72h > data.list[i].dt){
            icon = app.actions.weatherIcon(data.list[i].weather[0].id);
            mintemp = data.list[i].main.temp_min;
            maxtemp = data.list[i].main.temp_max;

            document.querySelector('.days li:nth-child(4) .icon').src = icon;
            document.querySelector('.days li:nth-child(4) .mintemp').innerHTML = mintemp;
            document.querySelector('.days li:nth-child(4) .maxtemp').innerHTML = maxtemp;
          }
        }

        //data in 5 days
        //console.log('in 5 days: '+todayPlus96h);      
        for(i=0; i < data.list.length; i++){
          if(todayPlus96h > data.list[i].dt){
            icon = app.actions.weatherIcon(data.list[i].weather[0].id);
            mintemp = data.list[i].main.temp_min;
            maxtemp = data.list[i].main.temp_max;

            document.querySelector('.days li:nth-child(5) .icon').src = icon;
            document.querySelector('.days li:nth-child(5) .mintemp').innerHTML = mintemp;
            document.querySelector('.days li:nth-child(5) .maxtemp').innerHTML = maxtemp;
          }
        }

        var place = document.getElementById('city'),
          time = document.getElementById('time'),
          temperature = document.getElementById('temperature'),
          description = document.getElementById('description'),
          weatherTodayIcon = document.getElementById('weather-icon'),
          today = document.getElementById('today'),
          day = document.getElementById('day'),
          month = document.getElementById('month');


        setInterval(function() {
          app.actions.refreshTime();
        },1000);


        //update HTML data
        weatherTodayIcon.src=app.actions.weatherIcon(weatherCode);
        place.innerHTML=city;
        time.innerHTML=timeNow; 
        temperature.innerHTML=temp+'&#8451';
        description.innerHTML=weatherDesc;
        today.innerHTML=app.actions.weekDay();//weekDay[dayNow.getDay()];
        day.innerHTML=dayNow.getUTCDate();
        month.innerHTML=dayNow.getUTCMonth() + 1;

        } 

        else if (xmlHttp.readyState === 4 && xmlHttp.status === 404) {
            console.error('ERROR! 404');
            var data = JSON.parse(xmlHttp.responseText);
        }

    };
    xmlHttp.open('GET', url, true);
    xmlHttp.send();
  },
  actions: {
    weatherIcon: function(code) {
      //http://openweathermap.org/weather-conditions
      //var iconSrc = 'http://openweathermap.org/img/w/';
      var iconSrc = 'img/';
      switch(code){
        case 200:
        case 201:
        case 202:
        case 210:
        case 211:
        case 212:
        case 221:
        case 230:
        case 231:
        case 232:                                       
          //Thunderstorm
          iconSrc += 'icon_thunderstorm.png';
          break;
        case 300:
        case 301:
        case 302:
        case 310:
        case 311:
        case 312:
        case 313:
        case 314:
        case 321:
          //Drizzle
          iconSrc += 'icon_sunny_rain.png';           
          break;
        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
          //Rain
          iconSrc += 'icon_rain.png';           
          break;
        case 511:
        case 520:
        case 521:
        case 522:
        case 531:
          //Extreme Rain
          iconSrc += 'icon_thunderstorm.png';           
          break;            
        case 600:
        case 601:
        case 602:
        case 611:
        case 612:
        case 615:
        case 616:
        case 620:
        case 621:
        case 622:
          //Snow
          iconSrc += 'icon_snow.png';           
          break;
        case 701:
        case 711:
        case 721:
        case 731:
        case 741:
        case 751:
        case 761:
        case 762:
        case 771:
        case 781:
          //Atmosphere
          iconSrc += 'icon_fog.png';                        
          break;
        case 800:
          //Clear
          iconSrc += 'icon_sun.png';
          break;  
        case 801:
        case 802:
        case 803:
        case 804:
          //Clouds
          iconSrc += 'icon_cloudy.png';
          break;  
        case 900:
          //Extreme tornado
          iconSrc += 'icon_wind.png';
          break;            
        case 901:
          //Extreme tropical storm
          iconSrc += 'icon_wind.png';
          break;            
        case 902:
          //Extreme hurricane
          iconSrc += 'icon_wind.png';
          break;            
        case 903:
          //Extreme cold
          iconSrc += 'icon_snow.png';
          break;            
        case 904:
          //Extreme hot
          iconSrc += 'icon_sun.png';
          break;  
        case 905:
          //Extreme windy
          iconSrc += 'icon_wind.png';
          break;  
        case 906: 
          //Extreme hail
          iconSrc += 'icon_snow.png';
          break;  
        case 951:
          //additional calm
          iconSrc += 'icon_sun.png';
          break;            
        case 952:
          //additional light breeze
          iconSrc += 'icon_wind.png';
          break;            
        case 953:
          //additional gentle breeze
          iconSrc += 'icon_wind.png';
          break;            
        case 954:
          //additional moderate breeze
          iconSrc += 'icon_wind.png';
          break;            
        case 955:
          //additional fresh breeze
          iconSrc += 'icon_wind.png';
          break;            
        case 956:
          //additional strong breeze
          iconSrc += 'icon_wind.png';
          break;            
        case 957:
          //additional high wind, near gale
          iconSrc += 'icon_wind.png';
          break;            
        case 958:
          //additional gale
          iconSrc += 'icon_wind.png';
          break;  
        case 959:
          //additional severe gale
          iconSrc += 'icon_wind.png';
          break;  
        case 960:
          //additional storm
          iconSrc += 'icon_thunderstorm.png';
          break;  
        case 961:
          //additional violent storm
          iconSrc += 'icon_thunderstorm.png';
          break;  
        case 962:
          //additional hurricane
          iconSrc += 'icon_wind.png';
          break;                                      
      }
      return iconSrc;
    },
    geolocation: function() {
      if('geolocation' in navigator){
        requestLocation();
      }else{
        console.log('Geolocalización no soportada por el navegador');
      }
      function requestLocation(){
        var options = {
          enableHighAccuracy: false,
          timeout: 5000,
          maximumAge: 0
        };
        navigator.geolocation.getCurrentPosition(callback, errorHandler);
      } 

      function callback(position) {
          var lat = position.coords.latitude;
          var lon = position.coords.longitude;
        var latlong = {
          'latitude': lat,
          'longitude': lon
        }
        //alert(latlong.latitude, latlong.longitude);
        return latlong;
      }

      function errorHandler(error) {
        switch(error.code) {
          case error.PERMISSION_DENIED:
            alert('Geolocalización denegada por el usuario.');
            break;
          case error.POSITION_UNAVAILABLE:
            alert('Información de la localización no disponible.');
            break;
          case error.TIMEOUT:
            alert('Tiempo de respuesta ha expirado.');
            break;
          case error.UNKNOWN_ERROR:
            alert('Error desconocido');
            break;
        }
      }

    },
    iplocation: function() {
      var location = {ip: '', latitude:'', longitude:''};

      //1st ajax request
      var xmlHttp = new XMLHttpRequest();
          xmlHttp.onreadystatechange = function() {
              if (xmlHttp.readyState === 4 && xmlHttp.status >= 200 && xmlHttp.status <= 400) {
                  var data = JSON.parse(xmlHttp.responseText);
                  var ip = data.ip;
                  location.ip = ip;

                  //2nd nested ajax request
          var xmlHttp2nd = new XMLHttpRequest();
              xmlHttp2nd.onreadystatechange = function() {
                  if (xmlHttp2nd.readyState === 4 && xmlHttp2nd.status >= 200 && xmlHttp2nd.status <= 400) {
                      var data = JSON.parse(xmlHttp2nd.responseText);
  
                      location.latitude=data.latitude;
                      location.longitude=data.longitude;
              
              console.groupCollapsed('Location data');
                      console.log(location);
              console.groupEnd(); 

              console.log('initialize app');
              app.init(location);

              return location;                    

                  } else if (xmlHttp2nd.readyState === 4 && xmlHttp2nd.status === 404) {
                      console.error('ERROR! 404');
                      var data = JSON.parse(xmlHttp2nd.responseText);
                  }
              };
              xmlHttp2nd.open('GET', 'http://freegeoip.net/json/'+ip, true);
              xmlHttp2nd.send();

              } else if (xmlHttp.readyState === 4 && xmlHttp.status === 404) {
                  console.error('ERROR! 404');
                  var data = JSON.parse(xmlHttp.responseText);
              }
          };
          xmlHttp.open('GET', 'http://api.ipify.org?format=json', true);
          xmlHttp.send();
    },
    weekDay: function(addDays) {
      var add = addDays || 0;
      var day = new Date();
      var dayNames = new Array ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo');
      return dayNames[(day.getDay()-1)+add];//-1 compensate array dayNames starts in 0
    },
    refreshTime: function() { 
      var dayNow = new Date();
      timeNow = dayNow.toLocaleString('es-ES', { hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false });
      setInterval(function() {
        time.innerHTML=timeNow;
      },100);
    }
  }
};
app.actions.iplocation();

```

HTML
```html
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>EL TIEMPO</title>
</head>
<body>

<main class="mainwr">
  <div class="icon-wr">
    <img id="weather-icon" src="">
  </div>
  <div class="today-info">
    <h1 id="city"></h1>
    <p id="time" class="hide"></p>
    <h2 id="temperature"></h2>
    <h3 id="description"></h3>
  </div>
  <div class="dateinfo">
    <div id="today" class="left"></div>
    <div class="right">
      <div id="day" class="number"></div>
      <div id="month" class="number"></div>     
    </div>
    <div class="clearfix"></div>
  </div>  
  <div class="other-days">
    <ul class="days">
      <li>
        <span class="weekday"></span>
        <span class="imgwr"><img class="icon" src=""></span>
        <span class="mintemp"></span>
        <span class="maxtemp"></span>         
      </li>
      <li>
        <span class="weekday"></span>
        <span class="imgwr"><img class="icon" src=""></span>
        <span class="mintemp"></span>
        <span class="maxtemp"></span>       
      </li>
      <li>
        <span class="weekday"></span>
        <span class="imgwr"><img class="icon" src=""></span>
        <span class="mintemp"></span>
        <span class="maxtemp"></span>       
      </li>
      <li>
        <span class="weekday"></span>
        <span class="imgwr"><img class="icon" src=""></span>
        <span class="mintemp"></span>
        <span class="maxtemp"></span>       
      </li>
      <li>
        <span class="weekday"></span>
        <span class="imgwr"><img class="icon" src=""></span>
        <span class="mintemp"></span>
        <span class="maxtemp"></span>       
      </li>
    </ul>
  </div>

</main>
</body>
</html>
```
