import 'package:flutter/material.dart';
import '../utils/config.dart';

class DetailsScreen extends StatelessWidget {
  final String imagePath;
  final String name;
  final String address;

  const DetailsScreen({super.key, required this.imagePath,required this.name, required this.address });

  _bulidIcon({
    required BuildContext context,
    required String icon,
    makeItBiger = false,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: makeItBiger ? fullWidth(context) * 0.1 : null,
        padding: EdgeInsets.all(fullWidth(context) * 0.02),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0x771D1D1D),
        ),
        child: Image.asset(icon),
      ),
    );
  }

  _bulidItem({
    required BuildContext context,
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        Container(
          width: fullWidth(context) * 0.08,
          height: fullWidth(context) * 0.08,
          decoration: BoxDecoration(
            color: Color(0xFFEDEDED), //
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 18, color: Colors.black),
        ),
        SizedBox(width: fullWidth(context) * 0.01),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xFF7A7A7A),
          ),
        ),
      ],
    );
  }

  _bulidPlaceDetails({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(fullWidth(context) * 0.04),
      width: fullWidth(context) * 0.73,
      decoration: BoxDecoration(
        color: Color.fromARGB(176, 29, 29, 29),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Price",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          SizedBox(height: fullHeight(context) * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/icons/marker.png",
                    height: fullHeight(context) * 0.02,
                  ),
                  SizedBox(width: fullWidth(context) * 0.01),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),

              RichText(
                text: TextSpan(
                  text: '\$', // First part of the text
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  children: [
                    TextSpan(
                      text: '230',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildImgageViewer({
    required BuildContext context,
    required String imagePath,
  }) {
    return Stack(
      children: [
        Container(
          width: fullWidth(context) * 0.92,
          height: fullHeight(context) * 0.45,
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
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
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: fullHeight(context) * 0.01,
            start: fullWidth(context) * 0.03,
            end: fullWidth(context) * 0.06,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bulidIcon(
                context: context,
                icon: "assets/icons/arrow_left.png",
                makeItBiger: true,
                onTap: () => Navigator.pop(context),
              ),
              _bulidIcon(context: context, icon: "assets/icons/archive.png"),
            ],
          ),
        ),
        PositionedDirectional(
          bottom: fullHeight(context) * 0.02,
          start: fullWidth(context) * 0.042,
          child: _bulidPlaceDetails(context: context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.07),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: fullHeight(context) * 0.08),
                  _buildImgageViewer(context: context, imagePath: imagePath),
                  SizedBox(height: fullHeight(context) * 0.03),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Row(
                      children: [
                        Text(
                          "Overview",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: fullWidth(context) * 0.1),
                        Text(
                          "Details",
                            style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            color: Color.fromARGB(255, 93, 93, 93),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: fullHeight(context) * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _bulidItem(
                        context: context,
                        icon: Icons.access_time_filled_outlined,
                        title: "8 hours",
                      ),
                      _bulidItem(
                        context: context,
                        icon: Icons.cloud,
                        title: "16  C",
                      ),
                      _bulidItem(
                        context: context,
                        icon: Icons.star,
                        title: "4.5",
                      ),
                    ],
                  ),
                  SizedBox(height: fullHeight(context) * 0.03),
                  Text(
                    "This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys. The Andes are also home to ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF7A7A7A),
                    ),
                  ),
                ],
              ),
            ),

            MaterialButton(
              onPressed: () {},
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: fullWidth(context) * 0.92,
                height: fullHeight(context) * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Book Now",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: fullWidth(context) * 0.03),
                    Image.asset("assets/icons/send.png"),
                  ],
                ),
              ),
            ),

            SizedBox(height: fullHeight(context) * 0.05),
          ],
        ),
      ),
    );
  }
}
