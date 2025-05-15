import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/app_routes.dart';
import 'package:flutter_portfolio/utils/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filters = ["Most Viewed", "Nearby", "Latest"];

  final List<Map<String, Object>> places = [
    {
      'title': 'Mount Fuji',
      'location': 'Tokyo, Japan',
      'rating': 4.8,
      'imagePath': 'assets/images/photo1.png',
    },
    {
      'title': 'Andes Mountain',
      'location': 'South America',
      'rating': 4.5,
      'imagePath': 'assets/images/photo2.png',
    },
  ];

  int selectedFilterIndex = 0;

  _onFilterSelected(int index) => setState(() => selectedFilterIndex = index);

  _placeCard(
    BuildContext context,
    String title,
    String location,
    double rating,
    String imagePath,
  ) {
    return GestureDetector(
      onTap: () => AppRoutes.routePush(context, AppRoutes.details , args: {
        'imagePath': imagePath,
        'name': title,
        'address': location,
       }
      ),

      child: Stack(
        children: [
          Container(
            width: fullWidth(context) * 0.63,
            height: fullHeight(context) * 0.43,
            margin: EdgeInsets.only(right: fullWidth(context) * 0.06),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.40),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: SizedBox(),
          ),
          PositionedDirectional(
            top: fullHeight(context) * 0.02,
            end: fullWidth(context) * 0.1,
            child: Container(
              padding: EdgeInsets.all(fullWidth(context) * 0.02),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x771D1D1D),
              ),
              child: Image.asset("assets/icons/heart.png"),
            ),
          ),

          PositionedDirectional(
            start: fullWidth(context) * 0.035,
            bottom: fullHeight(context) * 0.04,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: fullWidth(context) * 0.05,
              ),
              width: fullWidth(context) * 0.55,
              decoration: BoxDecoration(
                color: Color(0xA61D1D1D),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: fullHeight(context) * 0.01),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: fullHeight(context) * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/marker.png",
                            height: fullHeight(context) * 0.017,
                          ),
                          SizedBox(width: fullWidth(context) * 0.015),
                          Text(
                            location,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_outline,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(width: fullWidth(context) * 0.01),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: fullHeight(context) * 0.01),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search places',
        hintStyle: TextStyle(fontFamily: 'Roboto', color: Colors.grey),
        suffixIcon: Image.asset("assets/icons/setting.png"),
        fillColor: Colors.transparent,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ), // Red border for enabled state
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ), // Red border for focused state
        ),
      ),
    );
  }

  _filterItem({required String filter, required bool isSelected}) {
    return Card(
      margin: EdgeInsets.zero,
      color: isSelected ? Colors.black : Color(0xFFFBFBFB),
      elevation: isSelected ? 4 : 0,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected ? Colors.black : Color.fromARGB(255, 243, 243, 243),
            width: 2,
          ),
        borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.05),
          child: Text(
            filter,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: fullHeight(context) * 0.05),
              _searchBar(),
              SizedBox(height: fullHeight(context) * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular places',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  InkWell(
                    onTap:  () => AppRoutes.routePush(context, AppRoutes.allPlaces),
                    child: Text(
                      "View all",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
             Container(
                height: fullHeight(context) * 0.12,
                width: fullWidth(context),
                padding: EdgeInsets.symmetric(
                  vertical: fullHeight(context) * 0.03
                ),
                child: ListView.separated(
                  itemCount: filters.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsetsDirectional.zero,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      enableFeedback: false,
                      onTap: () => _onFilterSelected(index),
                      child: _filterItem(
                        filter: filters[index],
                        isSelected: selectedFilterIndex == index,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: fullWidth(context) * 0.05);
                  },
                ),
              ),

            ],
          ),
        ),

        SizedBox(
          height: fullHeight(context) * 0.45,
          width: fullWidth(context),
          child:
              selectedFilterIndex != 0
                  ? Center(
                    child: Text(
                      "List empty",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  )
                  : ListView.builder(
                    itemCount: places.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsetsDirectional.only(
                      start: fullWidth(context) * 0.05,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return _placeCard(
                        context,
                        places[index]['title'] as String,
                        places[index]['location'] as String,
                        places[index]['rating'] as double,
                        places[index]['imagePath'] as String,
                      );
                    },
                  ),
        ),
        SizedBox(height: fullHeight(context) * 0.02),
      ],
    );
  }
}
