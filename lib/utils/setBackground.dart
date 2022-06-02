String setbackground (String currentWeather){
  String background = "";
  if (currentWeather == "Clear"){
    background = "lib/assets/soleil.jpeg";
  }
  else if (currentWeather == "Clouds"){
    background = "lib/assets/nuageux.jpg";
  }
  else if (currentWeather == "Rain"){
    background = "lib/assets/pluie.jpg";
  }
  else if (currentWeather == "Snow"){
    background = "lib/assets/neige.jpg";
  }
  else if (currentWeather == "Thunderstorm"){
    background = "lib/assets/orage.jpg";
  }
  else if (currentWeather == "Mist"){
    background = "lib/assets/brouillard.jpg";
  }
  else if (currentWeather == "Fog"){
    background = "lib/assets/brouillard.jpg";
  }
  else if (currentWeather == "Drizzle"){
    background = "lib/assets/pluie.jpg";
  }
  else if (currentWeather == "Haze"){
    background = "lib/assets/brouillard.jpg";
  }
  else if (currentWeather == "Dust"){
    background = "lib/assets/brouillard.jpg";
  }
  else if (currentWeather == "Ash"){
    background = "lib/assets/brouillard.jpg";
  }
  else if (currentWeather == "Squall"){
    background = "lib/assets/orage.jpg";
  }
  else if (currentWeather == "Tornado"){
    background = "lib/assets/orage.jpg";
  }
  else if (currentWeather == "Clear sky"){
    background = "lib/assets/nuageux.jpg";
  }
  else if (currentWeather == "Few clouds"){
    background = "lib/assets/nuageux.jpg";
  }
  return background;
}