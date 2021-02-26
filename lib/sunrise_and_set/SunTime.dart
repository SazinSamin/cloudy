class SunTime{

  var sunriseEpoch;
  var sunriseAtAll;

  SunTime(this.sunriseEpoch);

  Execute(){
    DateTime sunrise = DateTime.fromMillisecondsSinceEpoch(sunriseEpoch * 1000);
    print(sunrise);
    if(sunrise.hour > 12){
      var sunHour = sunrise.hour - 12;
        sunriseAtAll = sunHour.toString() + " : " +sunrise.minute.toString() + " PM";
      print(sunriseAtAll);
    }else{
        sunriseAtAll = sunrise.hour.toString() + " : " +sunrise.minute.toString() + " AM";
      print(sunriseAtAll);
    }
    return sunriseAtAll;
  }
}

/*main(){
  SunTime sunTime = SunTime(1614274398);
  sunTime.Execute();
}*/