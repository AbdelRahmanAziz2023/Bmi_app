import 'dart:math';
import 'package:bmi/ResultPage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var age=20;
  var highet=175.0;
  var wighet=70.0;
  bool isMale=true;
  void getResult ()async
  {
    double result= wighet /pow(highet/100,2);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MyResult(age: age, isMale: isMale, result: result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height:40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color:isMale?Colors.teal:Colors.grey[900],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.male,size:60,),
                            Text('Male',style:Theme.of(context).textTheme.headline2,),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap:(){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color:isMale==false?Colors.teal:Colors.grey[900],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.female,size:60,),
                            Text('Female',style:Theme.of(context).textTheme.headline2,),
                          ],),),
                    ),
                  ],),
                Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    color:Colors.grey[900],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                      Text('Height',style:Theme.of(context).textTheme.headline2,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text(highet.toStringAsFixed(0),style:Theme.of(context).textTheme.headline1,),
                          Text(' cm',style:Theme.of(context).textTheme.headline2,),
                        ],
                      ),
                      Slider(value: highet, onChanged:(double val)=>setState(() {
                        highet=val;
                      }),
                      label:'Height',
                      divisions:130,
                      min:90.0,
                        max: 220.0,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color:Colors.grey[900],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Weight',style:Theme.of(context).textTheme.headline2,),
                          Text(wighet.toStringAsFixed(0),style:Theme.of(context).textTheme.headline1,),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap:(){setState(() {
                                  wighet+=1;
                                });} ,
                                child: Container(
                                  alignment:Alignment.center,
                                  width:50 ,
                                  height: 50,
                                  decoration:BoxDecoration(
                                    color:Colors.grey[700],
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Icon(Icons.add,),
                                ),
                              ),
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    wighet-=1;
                                  });
                                } ,
                                child: Container(
                                  alignment:Alignment.center,
                                  width:50 ,
                                  height: 50,
                                  decoration:BoxDecoration(
                                      color:Colors.grey[700],
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Icon(Icons.remove),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color:Colors.grey[900],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Age',style:Theme.of(context).textTheme.headline2,),
                          Text('$age',style:Theme.of(context).textTheme.headline1,),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap:(){setState(() {
                                  age+=1;
                                });} ,
                                child: Container(
                                  alignment:Alignment.center,
                                  width:50 ,
                                  height: 50,
                                  decoration:BoxDecoration(
                                      color:Colors.grey[700],
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                              ),
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    age-=1;
                                  });
                                } ,
                                child: Container(
                                  alignment:Alignment.center,
                                  width:50 ,
                                  height: 50,
                                  decoration:BoxDecoration(
                                      color:Colors.grey[700],
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Icon(Icons.remove),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],),
                InkWell(
                  onTap:getResult ,
                  child: Container(
                    alignment: Alignment.center,
                    height:80,
                    width:double.infinity,
                    color: Colors.teal,
                    child: Text('Calculate',style: Theme.of(context).textTheme.headline1,),
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
