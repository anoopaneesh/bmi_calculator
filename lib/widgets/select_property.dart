import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class SelectProperty extends StatelessWidget {
  final Function addHandler;
  final Function substractHandler;
  final String property;
  final double value;
  final double width;
  SelectProperty({@required this.width,@required this.property,@required this.value,@required this.addHandler,@required this.substractHandler});
  Widget addFunction(String type,Function handler){
    return Container(
      decoration: BoxDecoration(shape:BoxShape.circle,color: Colors.white70),
      child: IconButton(
        icon: Icon((type=='add')?Icons.add:Icons.remove,color: Colors.black,),
        onPressed: (){
          if(property == 'WEIGHT') handler('w');
          else handler('a');
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color : Theme.of(context).primaryColor,
      elevation: 6,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8,),
        width: width,
        child: Column(
          children: [
            Text(property,style: Theme.of(context).textTheme.headline6,),
            Text(value.toStringAsFixed(0),style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 50),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                addFunction('subtract', substractHandler),
                SizedBox(width: 6,),
                addFunction('add', addHandler),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
