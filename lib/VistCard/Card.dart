import 'package:flutter/material.dart';
import 'package:safer/pages/drawer/drawer.dart';


class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {


    var _keyDrawer;
    var valueChoose;

    List ListItem = [

      "كريمي جوال",
      "ام فلوس",
      "موبايل مني",
      "ون كاش",
    ];

  get index => null;

  get decoration => null;

    Widget headerBuild() {
      return Container(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [

            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(1, 1),
                      ),
                      BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(-1, -1))
                    ],
                    borderRadius: BorderRadius.circular(40)),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.yellow.shade700,
                    size: 25,
                  ),
                  onPressed: () {},
                )),
            const Expanded(child: Text("")),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(1, 1),
                      ),
                      BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(-1, -1))
                    ],
                    borderRadius: BorderRadius.circular(40)),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.yellow.shade700,
                    size: 25,
                  ),
                  onPressed: () {},
                )),
          ],
        ),
      );
    }

    @override
    late final String title;



    @override
    Widget build(BuildContext context) {
      return Scaffold(
        key: _keyDrawer,
        endDrawer: MyDrawer(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              headerBuild(),


              Center(
                child: Column(
                  children: [
                     Container(
                        height: 50,
                        width: 150,
                      margin: EdgeInsets.only(top: 100),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0.0 , 20.0),
                            blurRadius: 30.0,
                            color: Colors.black12,

                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 110,
                            padding:  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                            child:InkWell (
                              onTap: (){
                                 Navigator.of(context).pushReplacementNamed("payment");
                              },
                              child: const Text("كاش ", style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'Lateef-Regular',
                            
                                fontWeight: FontWeight.bold,
                              ),
                                textAlign: TextAlign.right,
                              ),
                            ),

                             decoration: BoxDecoration(
                                 color:Colors.yellow.shade700,
                               borderRadius: const BorderRadius.only(
                                 bottomRight: Radius.circular(9.0),
                                 topRight: Radius.circular(9.0),
                                 bottomLeft: Radius.circular(200.0),
                               )
                             ),

                          ),
                          const Icon(Icons.attach_money,color: Colors.grey,size: 25,)

                        ],
                      ),

                    ),

                    Container(

                      margin: const EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                          color: Colors.black,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text("أونلاين", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.yellow.shade700,
                      ),),
                    ),
                    Padding(
                      padding:EdgeInsets.all(20),
                      child: Container(
                        height: 50,
                        width: 170,
                        //padding:  const EdgeInsets.symmetric(horizontal: 0,vertical: 0 ),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0.0 , 20.0),
                                blurRadius: 30.0,
                                color: Colors.black12,

                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(11.0)),

                        child: DropdownButton(

                          //isExpanded: true,
                          hint: Container(
                            width: 130,
                            height: 110,
                            padding:  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 7.0),
                            decoration: BoxDecoration(
                                color:Colors.yellow.shade700,
                                borderRadius:  BorderRadius.only(
                                  bottomRight: Radius.circular(9.0),
                                  topRight: Radius.circular(9.0),
                                  bottomLeft: Radius.circular(200.0),
                                )
                            ),
                            child: const Text(
                              "الدفع عبر ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          dropdownColor: Colors.yellow.shade700,
                          value: valueChoose,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 30,
                          underline: const SizedBox(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose = newValue;
                            });
                          },
                          items: ListItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  child: Container(
                                    width: 130,
                                    height: 110,
                                    padding:  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        color:Colors.yellow.shade700,
                                        borderRadius:  BorderRadius.only(
                                          bottomRight: Radius.circular(9.0),
                                          topRight: Radius.circular(9.0),
                                          bottomLeft: Radius.circular(200.0),
                                        )
                                    ),



                                    child: Text(
                                      valueItem,

                                      style:const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: 'Lateef-Regular',
                                      ),
                                      textAlign: TextAlign.right,
                                    ),

                                  )),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /* FixedTimeline.tileBuilder(
                      builder: TimelineTileBuilder.connectedFromStyle(
                        connectionDirection: ConnectionDirection.before,

                          connectorStyleBuilder: (context, index){
                          return (index == 1)?ConnectorStyle.dashedLine : ConnectorStyle.solidLine;
                          },

                          indicatorStyleBuilder: (context, index)=>IndicatorStyle.dot,
                        itemExtent: 30.0,
                          itemCount: 4,
                      ),
                  ),*/



            ],
          ),
        ),
      );
  }
}
