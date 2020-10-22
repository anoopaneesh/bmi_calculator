import 'package:flutter/material.dart';
class HeightSlider extends StatelessWidget {
  final Function sliderHandler;
  final double width;
  final double sliderPosition;
  HeightSlider({@required this.width,@required this.sliderPosition,@required this.sliderHandler});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Theme.of(context).primaryColor,
      child: Container(
        width: width,
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('HEIGHT',style: Theme.of(context).textTheme.headline6,),
            SizedBox(height: 10,),
            Text('${sliderPosition.toStringAsFixed(0)} cm',style: Theme.of(context).textTheme.headline6,),
            SizedBox(height: 10,),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 10,
                activeTrackColor: Colors.white70,
                inactiveTrackColor: Colors.white70,
                thumbColor: Colors.white,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15)
              ),
              child: Slider(
                onChanged: (newPosition){sliderHandler(newPosition);},
                value: sliderPosition,
                min: 50,
                max: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
