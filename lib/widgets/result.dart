import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final double bmi;
  final Function resetHandler;
  var category="";
  var color = Colors.purple;
  Result({
    this.bmi,
    this.resetHandler
});
  @override
  Widget build(BuildContext context) {
    if(bmi <= 18.5){
      category = "UNDERWEIGHT";
      color = Colors.blue;
    }else if(bmi <= 24.9){
      category = "NORMAL";
      color = Colors.green;
    }else if(bmi <= 29.9){
      category = "OVERWEIGHT";
      color = Colors.yellow;
    }else if(bmi <= 34.9){
      category = "OBESE";
      color = Colors.deepOrange;
    }else{
      category = "EXTREMELY OBESE";
      color = Colors.red;
    }
    return Container(
      color: color,
      child: Card(
        color: color,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(category,style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 30,),),
              Text('BMI is ${bmi.toStringAsFixed(0)}',style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 30),),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: resetHandler,
                  child: Text('ReCalculate',))
            ],
          ),
        ),
      ),
    );
  }
}
