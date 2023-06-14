import 'package:flutter/material.dart';



class MyButton extends StatelessWidget {
  final title;
  final function;
  final mdw;
  const MyButton({Key? key, this.function, this.title, this.mdw})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: Colors.orangeAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: function,
        minWidth: mdw / 1.5,
        child: Text(
          "$title",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ));
  }
}



class Roomes extends StatelessWidget {
final txt;
final txt1;
  final  txt2;
  final Number;
  final txt3;
  final star;
  final img;
  final ontap;
  const Roomes({super.key, this.txt2, this.txt,this.txt3, this.Number, this.star, this.txt1,this.img,this.ontap});
  @override
  Widget build(BuildContext context) {
    return  Container(
     margin: EdgeInsets.all(10),
        
        decoration: BoxDecoration(
          color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2,5),
                      blurRadius: 10,color: Colors.black12,

                    )
                  ],),
        height: 110,
        child: Stack(
          children: [
             Container(
                   height:150 ,
                   width: 120,
                    decoration: BoxDecoration(
                       color: Colors.yellow,
                       borderRadius:BorderRadius.circular(10),
                         image:  DecorationImage(
                           fit: BoxFit.fill,
                              image: AssetImage(img),
          ),
                        ),
                   ),
                   Container(
                     margin: EdgeInsets.only(right: 150),
                     child: Column(
                       children: [
                          Text(txt,
                          style: TextStyle(fontSize: 20,
                         color: Color.fromARGB(255, 255, 189, 6)),),
                          Row(mainAxisSize: MainAxisSize.min,
                                 children: [
                                  Text(txt1,style: TextStyle(
                                       color: Color.fromRGBO(171, 172, 173, 1)),),
                                       SizedBox(width: 30,),
                                  Icon(Icons.star,color: Colors.yellow,size:13),
                                  Icon(Icons.star,color: Colors.yellow,size:13),
                                  Icon(Icons.star,color: Colors.yellow,size:13),
                                  Icon(Icons.star,color: Colors.yellow,size:13),
                                     
                                  
                                   
                                 ],
                           ),
                            Row(mainAxisSize: MainAxisSize.min,
                                 children: [
                                  Text(txt2,style: TextStyle(
                                       color: Color.fromRGBO(171, 172, 173, 1)),),
                                       SizedBox(width: 50,),
                                 Text(Number)
                                     
                                  
                                   
                                 ],
                           ),
                           
                       ],       
                     ),
                   ),      
                Container(
                  margin: EdgeInsets.only(right:330,top: 10,bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
              children: [
                     Container(
               width: 50,
               height: 20,
               decoration: BoxDecoration(
                       color: Color.fromRGBO(171, 172, 173, 1),
                       borderRadius:BorderRadius.circular(12) ),
                       child: 
                           Text(txt3,style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,)
            
                   ),
                     Container(
                     width: 50,
                     height: 20,
                     
                     decoration: BoxDecoration(
                       color: Colors.red,
                       borderRadius:BorderRadius.circular(12) ),
                       child: InkWell(
                         onTap: () {
                            Navigator.of(context).pushReplacementNamed("addcard");
                         },
                       child:
                       Text("حجز",style: TextStyle(
                         fontSize: 13,color: Colors.white),
                       textAlign: TextAlign.center,)
             
               ),)
                  
              ],
            ),
                ),   
                Container(
                  margin: EdgeInsets.only(right: 150,top: 55),
                  width: 130,
                  child: Divider(color:Color.fromRGBO(171, 172, 173, 1),)),
                   Container(
                  
                    margin: EdgeInsets.only(right: 220,top: 80),
                    child: InkWell(
                     onTap: ontap,
                       child:
                    Text("المزيد",
                    style: TextStyle(fontSize: 15
                   ,color: Color.fromARGB(255, 255, 6, 6)),),),)     
        ]),
    );
  }
}


class butoonrev extends StatelessWidget {
  final txt;
  final function;
   butoonrev({superkey,this.txt,this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
     
         child:  MaterialButton(
                    onPressed:function,
                    child:
                        Text(
                          txt,
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                    height: 40,
                    minWidth: 100,
                    color:Colors.white60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )

    );
  }
}


class buttonback extends StatelessWidget {
  final txt;
  final icon;
  const buttonback({super.key,this.icon,this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
child:
  MaterialButton(
                    onPressed: () {
                    
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      
                      children: [
                       
                       
                        Text(
                          txt,
                          style: TextStyle( color: Color.fromARGB(255, 167, 166, 165),fontSize: 20),
                        ),
                         SizedBox(width: 5),
                         Icon(
                          icon,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    height: 40,
                    minWidth: 100,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
    );
  }
}