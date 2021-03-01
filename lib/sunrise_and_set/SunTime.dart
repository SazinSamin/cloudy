class SunTime{

  var sunriseEpoch;
  var sunriseAtAll;

  SunTime(this.sunriseEpoch);

  Execute(){
    DateTime sunrise = DateTime.fromMillisecondsSinceEpoch(sunriseEpoch * 1000);
    if(sunrise.hour > 12){
      var sunHour = sunrise.hour - 12;
        sunriseAtAll = sunHour.toString() + " : " +sunrise.minute.toString() + " PM";
    }else{
        sunriseAtAll = sunrise.hour.toString() + " : " +sunrise.minute.toString() + " AM";
    }
    return sunriseAtAll;
  }
}

