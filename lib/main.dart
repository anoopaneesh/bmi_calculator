import 'package:bmi_calculator/widgets/result.dart';

import './widgets/app_body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bmi Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6:TextStyle(color: Colors.white,fontSize: 20),
        ),
      ),
      home: MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _bmi = 0.0;
  var _isMale = true;
  var _sliderPosition = 50.0;
  var _weight = 20.0;
  var _age = 1.0;
  void _add(String t){
    setState(() {
      t == 'w'? _weight++ :_age++ ;
    });
  }
  void _substarct(String t){
    setState(() {
      if(t == 'w' && _weight > 20) _weight--;
      else if(t == 'a' && _age > 1) _age--;
    });
  }
  void _sliderHandler(double newPosition){
    setState(() {
      _sliderPosition = newPosition;
      //print('$newPosition is the value');
    });
  }
  void _clickedMale(){
    setState(() {
      _isMale = true;
    });
  }
  void _clickedFemale(){
    setState(() {
      _isMale = false;
    });
  }
  void _calculateBMI(){
    var bmi = (_weight)/((_sliderPosition/100)*(_sliderPosition/100));
    print('Your BMI is : ${bmi}');
    setState(() {
      _bmi = bmi;
    });
  }
  void _reset(){
    setState(() {
      _bmi = 0.0;
    });
  }
  Widget appBody(MediaQueryData _mediaQuery){
    return AppBody(
      mediaQuery: _mediaQuery,
      isMale: _isMale,
      sliderHandler: _sliderHandler,
      sliderPosition: _sliderPosition,
      weight: _weight,
      age: _age,
      add: _add,
      substract: _substarct,
      clickedFemale: _clickedFemale,
      clickedMale: _clickedMale,
      calculateBMI: _calculateBMI,
    );
  }
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child:_bmi == 0.0 ?Container(
          child: _mediaQuery.orientation == Orientation.landscape ?
          SingleChildScrollView(
            child: appBody(_mediaQuery),
          )
              :
          appBody(_mediaQuery),
        ) : Result(bmi:_bmi,resetHandler: _reset,)
      ),
    );
  }
}


