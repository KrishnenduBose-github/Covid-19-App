// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, dead_code

import 'package:covid19_app/models/country.dart';
import 'package:covid19_app/models/country_summary.dart';
import 'package:covid19_app/screens/country_loading.dart';
import 'package:covid19_app/services/covid_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'country_statistics.dart';

CovidService covidService = new CovidService();

class Country extends StatefulWidget {
  Country({Key? key}) : super(key: key);

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  TextEditingController _textController = new TextEditingController();
  Future<List<CountryModel>>? countryList;
  Future<List<CountrySummaryModel>>? countrysummary;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    countryList = covidService.getCountryList();

    this._textController.text = "India";
    countrysummary = covidService.getCountrySummary("india");
  }

  List<String> _getSuggestions(List<CountryModel> list, String query) {
    List<String> matches = <String>[];

    for (var item in list) {
      matches.add(item.country);
    }
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countryList,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          //print(snapshot.data);
          return Center(
            child: Text("Error occured"),
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loadingInputCard();
          default:
            return !snapshot.hasData
                ? Center(
                    child: Text("Empty"),
                  )
                : /* Center(
                        child: Text("Data received"),
                      ) */
                ListView(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                          child: Text(
                            "Type the country name",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                              autofocus: true,
                              controller: this._textController,
                              decoration: InputDecoration(
                                  hintText: "Enter country name",
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(width: 0)),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: EdgeInsets.all(20),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        left: 24.0, right: 16.0),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ))),
                          suggestionsCallback: (pattern) {
                            return _getSuggestions(
                                snapshot.data as List<CountryModel>, pattern);
                          },
                          itemBuilder: (context, suggestions) {
                            return ListTile(
                              title: Text(suggestions as String),
                            );
                          },
                          transitionBuilder:
                              (context, suggestionBox, controller) {
                            return suggestionBox;
                          },
                          onSuggestionSelected: (suggestion) {
                            String str = suggestion.toString().toLowerCase();
                            //print(str);
                            this._textController.text = suggestion as String;
                            setState(() {
                              var temp = snapshot.data as List<CountryModel>;
                              /*if (covidService.getCountrySummary(str) == null)
                                print("slug is null");*/
                              /*countrysummary = covidService.getCountrySummary(temp
                                  .firstWhere(
                                      (element) => element.country == suggestion)
                                  .slug);*/
                              countrysummary =
                                  covidService.getCountrySummary(str);
                            });
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        FutureBuilder(
                            future: countrysummary,
                            builder: (context, snapshot) {
                              //print(snapshot.data as List<CountrySummaryModel>);
                              if (snapshot.hasError)
                                return Center(
                                  child: Text("Error"),
                                );
                              /* if (snapshot.data == null)
                                return Center(
                                  child: Text("No data available"),
                                );*/

                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Center(
                                    child: countryLoading(),
                                  ); /*CountryLoading(
                              inputTextLoading: false
                            );*/
                                default:
                                  return !snapshot.hasData
                                      ? Center(
                                          child: Text("Empty"),
                                        )
                                      : snapshot.data == null
                                          ? Center(
                                              child: Text("No data available"),
                                            )
                                          : CountryStatistics(
                                              snapshot.data
                                                  as List<CountrySummaryModel>,
                                            );
                              }
                            })
                      ],
                    ),
                  ]);
            ;
        }
      },
    );
  }
}
