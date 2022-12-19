import 'dart:ui';

import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double calculateBmi( int h, int w) {
        return (w/(h*h))*10000;
   
  }
  String checkState(double bmi)
  {
    if(bmi<18.5)
    {
      return "Underweight";
    }
    else if(bmi<24.9)
    {
      return "Healthy Weight";
    }
    else if(bmi<29.9)
    {
      return "Overweight";
    }
    else
    {
      return "Obesity";
    }
  }

  int height=150;
  int weight=50;
 late double bmi=calculateBmi(height, weight);
 late String state=checkState(bmi);
 late String gender="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
          Expanded(child:
          Row(
              children: [
             Expanded(child:
              GestureDetector(
                onTap:(){
                  setState(() {
                    gender="M";
                  print("M");
                  });
                  },
                child:
              Container(
               // height:200 ,
               // color:Colors.amber,
              // padding:EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                   color:gender=="M"?Colors.orange.withAlpha(150):Colors.orange.withAlpha(80),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                 child: Column(
                    children: [
                      Icon(Icons.male,size:130),
                      Text("Male",
                      style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold))

                    ],
                  ),
               ), ),),
               SizedBox(
                width: 15,
               )
               ,
                Expanded(child:GestureDetector(
                onTap:(){
                  setState(() {
                     gender="F";
                  print("F");
                  });
                 
                },
                child: Container(
                //height: 200,
               // color:Colors.amber,
              //  padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color:gender=="F"?Colors.orange.withAlpha(150):Colors.orange.withAlpha(80),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                 child: Column(
                    children: [
                      Icon(Icons.female,size:130),
                      Text("Female",
                       style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold))

                    ],
                  ),
               ), )
               ),
                 

              ],

            ), ) ,
            Expanded(child: Row(
              children: [
             Expanded(child:Container(
              padding: EdgeInsets.all(12.0),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Height",style:TextStyle(fontSize:25.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$height",style:TextStyle(fontSize:20.0,color:ktextcolor,fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            Expanded(child: FloatingActionButton(onPressed:(){
                              setState(() {
                                if(height<500)
                              {
                                height++;
                                bmi=calculateBmi(height,weight);
                                state=checkState(bmi);
                                print(weight);

                                print(height);
                                
                              }
                              });
                              
                            } ,child:Icon(Icons.add),backgroundColor:kbuttoncolor,)),
                             Expanded(child: FloatingActionButton(onPressed:(){
                              setState(() {
                                if(height>50)
                              {
                                height--;
                                bmi=calculateBmi(height,weight);
                                state=checkState(bmi);
                                print(weight);
                                print(height);
                                
                              }
                              });
                             } ,child:Icon(Icons.remove),backgroundColor: kbuttoncolor,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),),
               Expanded(child:Container(
              padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Weight",style:TextStyle(fontSize:25.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$weight",style:TextStyle(fontSize:20.0,color:ktextcolor,fontWeight: FontWeight.bold)),
                      ),
                       Row(
                          children: [
                            Expanded(child: FloatingActionButton(onPressed:(){
                              setState(() {
                                if(weight<500)
                              {
                                weight++;
                                bmi=calculateBmi(height,weight);
                                state=checkState(bmi);
                                print(weight);
                                
                              }
                              });
                            } ,child:Icon(Icons.add),backgroundColor: kbuttoncolor,)),
                             Expanded(child: FloatingActionButton(onPressed:(){
                              setState(() {
                                if(weight>20)
                              {
                                weight--;
                                 bmi=calculateBmi(height,weight);
                                 state=checkState(bmi);
                                print(weight);
                                print(weight);
                                
                              }
                              });
                             } ,child:Icon(Icons.remove),backgroundColor: kbuttoncolor,)),
                          ],
                        ),
                      
                    ],
                  ),
                ),),

              ],
            )),
          Expanded(child:   Column(
              children: [
              Expanded(child:Text("BMI",style:TextStyle(fontSize:30.0),)),
              Expanded(child:Text(bmi.toStringAsFixed(2),style:TextStyle(fontSize:40.0,color:Color.fromARGB(255, 101, 31, 2),fontWeight: FontWeight.bold),)) ,
              Expanded(child:Text(state,style:TextStyle(fontSize:30.0),)) 
               
              ],
            ))
           
          ],
        ),
      ),
    );
  }
}
