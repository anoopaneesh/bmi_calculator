import 'package:flutter/material.dart';
import 'gender_card.dart';
import 'select_property.dart';
import 'height_slider.dart';
class AppBody extends StatelessWidget {
  final MediaQueryData mediaQuery;
  final bool isMale;
  final double sliderPosition;
  final double weight;
  final double age;
  final Function add;
  final Function substract;
  final Function clickedMale;
  final Function clickedFemale;
  final Function sliderHandler;
  final Function calculateBMI;
  AppBody({
    this.mediaQuery,
    this.weight,
    this.sliderPosition,
    this.isMale,
    this.age,
    this.add,
    this.substract,
    this.clickedMale,
    this.clickedFemale,
    this.sliderHandler,
    this.calculateBMI,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 10,),
            GestureDetector(
              onTap:clickedMale,
              child: GenderCard(
                gender: 'MALE', imageUrl: 'assets/images/male.png', elevation:isMale?0:10,clicked: isMale?true:false, width: mediaQuery.size.width*0.4,height: mediaQuery.size.height*0.2,),
            ),
            GestureDetector(
                onTap:clickedFemale,
                child: GenderCard(gender: 'FEMALE', imageUrl: 'assets/images/female.png', elevation:isMale?10:0,clicked: isMale?false:true, width:mediaQuery.size.width*0.4 ,height: mediaQuery.size.height*0.2,)),
            SizedBox(width: 10,),
          ],
        ),
        HeightSlider(width: mediaQuery.size.width * 0.8,sliderPosition: sliderPosition,sliderHandler: sliderHandler,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectProperty(width: mediaQuery.size.width * 0.4, property: 'WEIGHT', value: weight, addHandler: add, substractHandler: substract),
            SelectProperty(width: mediaQuery.size.width * 0.4, property: 'AGE', value: age, addHandler: add, substractHandler: substract)
          ],
        ),
        RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed:calculateBMI,
            child: Container(
              alignment: Alignment.center,
              width: mediaQuery.size.width,
              height: 60,
              child : Text('CALCULATE',style: Theme.of(context).textTheme.headline6,),
            )
        ),

      ],
    );
  }
}