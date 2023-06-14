import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';

import '../colors/AppColor.dart';
import '../mybutton/mybutton.dart';

class SliderIntro extends StatefulWidget {
  const SliderIntro({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SliderIntroState createState() => _SliderIntroState();
}

class _SliderIntroState extends State<SliderIntro> {
  int currentpage = 0;
  List listintro = [
    {"text": "مرحبا بكم في تطبيق سافر", "image": "assets/images/splash_2.jpg"},
    {
      "text":
          "نحن نساعدك على معرفه الأماكن السياحيه \n     في الجمهوريه اليمنيه بالكامل",
      "image": "assets/images/splash_2.jpg"
    },
    {
      "text":
          "نحن نعرض لك طريقة سهلة لمعرفه الفنادق والاستراحات \n             في معضم المحافضات اليمنيه ",
      "image": "assets/images/safers.png"
    },
  ];
  @override
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 2,
              child: PageView.builder(
                  onPageChanged: (val) {
                    setState(() {
                      currentpage = val;
                    });
                  },
                  itemCount: listintro.length,
                  itemBuilder: (context, i) {
                    return TextAndImage(
                      list: listintro[i],
                      mdw: mdw,
                    );
                  })),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(listintro.length,
                          (index) => buildControlPageView(index))),
                  Spacer(
                    flex: 5,
                  ),
                  MyButton(
                    title: "متابعة",
                    function: () {
                     
                         Navigator.of(context).pushReplacementNamed("home");
                     
                         
                                 
                                
                            
                           
                      
                    },
                    mdw: mdw,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ))
        ],
      )),
    );
  }

  AnimatedContainer buildControlPageView(index) {
    return AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 1),
        duration: const Duration(milliseconds: 500),
        width: currentpage == index ? 20 : 5,
        height: 5,
        decoration: BoxDecoration(
            color: AppColors.deep_orange, borderRadius: BorderRadius.circular(2.5)));
  }
}

class TextAndImage extends StatelessWidget {
  final list;
  final mdw;
  final lang;
  const TextAndImage({Key? key, this.list, this.mdw, this.lang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: mdw / 6),
            child: Text(
              "سافر",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const SizedBox(height: 30),
          Container(child: Text("${list['text']}")),
          SizedBox(height: 20),
          Image.asset(
            "${list['image']}",
            width: mdw / 1.5,
          )
        ],
      ),
    );
  }
}
