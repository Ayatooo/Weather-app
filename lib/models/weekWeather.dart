class WeekWeatherData {
  List<Daily>? daily;

  WeekWeatherData({this.daily});

  WeekWeatherData.fromJson(Map<String, dynamic> json) {
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(new Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.daily != null) {
      data['daily'] = this.daily!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Daily {
  Temp? temp;

  Daily({this.temp});

  Daily.fromJson(Map<String, dynamic> json) {
    temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.temp != null) {
      data['temp'] = this.temp!.toJson();
    }
    return data;
  }
}

class Temp {
  double? day;

  Temp({this.day});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
