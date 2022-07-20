// ignore_for_file: unnecessary_this, prefer_initializing_formals

class CountrySummaryModel {
  late final String country;
  late final int confirmed;
  late final int death;
  late final int recovered;
  late final int active;
  late final DateTime date;
  //late final String date;

  CountrySummaryModel(String country, int confirmed, int death, int recovered,
      int active, DateTime date) {
    this.country = country;
    this.confirmed = confirmed;
    this.death = death;
    this.active = active;
    this.date = date;
    this.recovered = recovered;
  }

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json) {
    return CountrySummaryModel(
        json["Country"],
        json["Confirmed"],
        json["Deaths"],
        json["Recovered"],
        json["Active"],
        DateTime.parse(json["Date"]));
  }
}
