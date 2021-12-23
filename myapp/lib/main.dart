import'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Increment and Decrement counter
  int _count=0;
  void _incrementValue(){
    setState(() {
      _count++;
    });
  }
  void _decrementValue(){
    setState(() {
      _count--;
    });
  }
  //Slider 
  double _currentValue=0;
  //
  var activeColor=Colors.yellow;
  var inActiveColor=Colors.black;

  var firstBox=Color(0xFF262B4E);
  var secondBox=Color(0xFF375684);

  void colorUpdate1(int colorValue){
    if(colorValue==1){
      if(firstBox==inActiveColor){
        firstBox=activeColor;
        secondBox=inActiveColor;
      }else if(firstBox==activeColor){
        firstBox=inActiveColor;


      }
    }
  }
  void colorUpdate2(int colorValue){
    if(colorValue==2){
      if(secondBox==inActiveColor){
        secondBox=activeColor;
        firstBox=inActiveColor;
      }else if(secondBox==activeColor){
        secondBox=inActiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            'My Design',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight:FontWeight.bold,
            ),
            ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.purple,
                          child: Column(
                            children: [
                              Text(
                                '$_count',
                                style: TextStyle(fontSize: 66),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                  FloatingActionButton(
                                    child: Icon(Icons.add),
                                    onPressed:_incrementValue
                                    ),
                                  FloatingActionButton(
                                    child: Icon(Icons.remove),
                                    onPressed:_decrementValue
                                    ),
                                ],
                                )
                            ],
                          ),

                      )
                      )

                ],
                )
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.pink,
                          child: Column(
                            children: [
                            Text(
                              _currentValue.round().toString(),
                              style: TextStyle(
                                fontSize: 60,
                              ),
                              ),
                              Slider(
                                max: 100,
                                min:0,
                                activeColor: Colors.yellow,
                                inactiveColor: Colors.black,
                                value: _currentValue, 
                                onChanged: (double newValue){
                                  setState(() {
                                    _currentValue=newValue;
                                  });
                                }
                                )
                            ],
                          ),

                      )
                      )

                ],
                )
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            color: firstBox,
                          ),
                          onTap: (){
                            setState(() {
                              colorUpdate1(1);
                            });
                          },
                          )
                          ),
                          SizedBox(
                            width: 4,
                          ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            color: secondBox,
                            
                          ),
                          onTap: (){
                            setState(() {
                              colorUpdate2(2);
                            });
                          },
                          )
                          ),

                ],
                )
                )
              ],
              ),
            
            ),
            );
  }
  }
