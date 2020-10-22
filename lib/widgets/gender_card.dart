import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final String imageUrl;
  final double elevation;
  final double width;
  final double height;
  final bool clicked;
  GenderCard(
      {@required this.gender,
      @required this.imageUrl,
      @required this.elevation,
      this.clicked,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueGrey,
      color: clicked?Theme.of(context).primaryColorDark:Theme.of(context).primaryColor,
      elevation:elevation,
      child: Container(
        width: width,
        height: (MediaQuery.of(context).orientation == Orientation.landscape)?height+15:height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl,width : gender == 'MALE' ? 50 : 30,),
            SizedBox(height:10),
            Text(gender,style: Theme.of(context).textTheme.headline6,),
          ],
        ),
      ),
    );
  }
}
