import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../core/app_export.dart';
import '../data/models/selectionPopupModel/searchResultModel.dart';
import '../presentation/home_screen/controller/home_controller.dart';
import 'app_bar/appbar_subtitle_2.dart';
import 'app_bar/custom_app_bar.dart';
import 'custom_text_form_field.dart';

class searchFlightDialog extends StatelessWidget {
  searchFlightDialog({
    Key? key,
    required this.onChange,
    this.isDestination = true,
  }) {
    controller.searchController.text = "";
    controller.searchResult = [];
  }

  final bool? isDestination;

  FlightSearchController controller = Get.put(FlightSearchController());

  final ValueChanged<FightSearch>? onChange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
        height: getVerticalSize(70),
        leadingWidth: 70,
        centerTitle: true,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(""),
          icon: Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: AppbarSubtitle2(
            text: isDestination! ? "Your Location" : "Destination"),
      ),
      body: Container(
        // height: size.height * 90 / 100,
        decoration: BoxDecoration(
          // color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Wrap(
          children: [
            Padding(
              padding: getPadding(right: 10, left: 10, top: 5),
              child: CustomTextFormField(
                  fontStyle: TextFormFieldFontStyle.PoppinsRegular16,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  autoFocus: true,
                  controller: controller.searchController,
                  onChange: (value) {
                    if (value.isEmpty) {
                      controller.searchResult = [];
                      return;
                    }
                    log("searching for $value");
                    controller.search(value);
                  },
                  hintText: "Country, City or airport",
                  prefix: Icon(
                    Icons.search,
                    size: 30,
                  )),
            ),
            GetBuilder(
                init: controller,
                builder: (_) {
                  return Padding(
                    padding: getPadding(top: 0, right: 20, left: 20),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.searchResult.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          log("ffff length ${controller.searchResult.length}");
                          var newOne = controller.searchResult[index];
                          FightSearch result = FightSearch();
                          try {
                            result = FightSearch.fromJson(
                                jsonEncode(controller.searchResult[index]));
                          } catch (e) {
                            log("Error: $e");
                          }

                          // print(controller.searchResult[index]);
                          var type = result.type;
                          var title = result.cityName!;
                          // result.hierarchy.toString().split('|').first;

                          return ListTile(
                            contentPadding: getPadding(all: 0),
                            onTap: () {
                              onChange!(FightSearch.fromJson(
                                  jsonEncode(controller.searchResult[index])));
                              Navigator.pop(context);
                            },
                            horizontalTitleGap: 0,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            leading: Icon(type == "airport"
                                ? Icons.flight_outlined
                                : Icons.location_city),
                            title: RichText(
                              text: TextSpan(
                                children: highlightOccurrences(title,
                                    controller.searchController.value.text),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            subtitle: Text(result.countryName ?? ""),
                          );
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
enum searchType { PLACE_TYPE_AIRPORT, PLACE_TYPE_CITY, PLACE_TYPE_COUNTRY }

List<TextSpan> highlightOccurrences(String source, String query) {
  if (query.isEmpty) {
    return <TextSpan>[TextSpan(text: source)];
  }

  final List<Match> matches = <Match>[];
  for (final String token in query.trim().toLowerCase().split(' ')) {
    matches.addAll(token.allMatches(source.toLowerCase()));
  }

  if (matches.isEmpty) {
    return <TextSpan>[TextSpan(text: source)];
  }
  matches.sort((Match a, Match b) => a.start.compareTo(b.start));

  int lastMatchEnd = 0;
  final List<TextSpan> children = <TextSpan>[];
  const Color matchColor = Color.fromARGB(255, 247, 80, 80);
  for (final Match match in matches) {
    if (match.end <= lastMatchEnd) {
      // already matched -> ignore
    } else if (match.start <= lastMatchEnd) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, match.end),
        style: const TextStyle(fontWeight: FontWeight.bold, color: matchColor),
      ));
    } else {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, match.start),
      ));

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: const TextStyle(fontWeight: FontWeight.bold, color: matchColor),
      ));
    }

    if (lastMatchEnd < match.end) {
      lastMatchEnd = match.end;
    }
  }

  if (lastMatchEnd < source.length) {
    children.add(TextSpan(
      text: source.substring(lastMatchEnd, source.length),
    ));
  }

  return children;
}
