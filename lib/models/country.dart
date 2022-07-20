// ignore_for_file: prefer_initializing_formals, unnecessary_this

class CountryModel {
  late final String country;
  late final String slug;
  //late final String iso2;

  CountryModel(
    String country,
    String slug,
    /*String ios2*/
  ) {
    this.country = country;
    this.slug = slug;
    //this.iso2 = iso2;
  }

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      json["Country"],
      json["slug"],
      //json["ISO2"],
    );
  }
}
