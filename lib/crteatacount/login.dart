import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:safer/crteatacount/Rigester.dart';


import '../colors/AppColor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mypassword, gmail;

  GlobalKey<FormState> forms = GlobalKey<FormState>();
  signup() async {
    var formedata = forms.currentState;
    if (formedata!.validate()) {
      formedata.save();
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: gmail,
          password: mypassword,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
              context: context,
              title: "erorr",
              body: Text("المستخدم المدخل غير صحيح"))
            ..show();
          ;
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
              context: context,
              title: "erorr",
              body: Text("كلمه السر غير صحيحه"))
            ..show();
        }
      }
    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
     
      body: SafeArea(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               Container(
                       height: 120,
                       width: 130,
                       decoration: BoxDecoration(
                         color: AppColors.deep_orange,
                         borderRadius: BorderRadius.only(bottomRight: Radius.circular(130)
                         ,topRight: Radius.elliptical(200, 50))
                       ),
                     ),
              Expanded(
                  child: Form(
                    key: forms,
                    child: ListView(
                      
                      children: [
                      
                        Container(
                          margin: EdgeInsets.only(right:50),
                          child: const Text("مرحبا بكم ",
                            style: TextStyle(color: Colors.black,
                        fontFamily: 'Lateef-Regular',
                        fontSize: 35,fontWeight: FontWeight.bold),),
                          
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30.0,right:80),
                          child: const Text("الرجاء تسجيل الدخول",
                            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,
                                color: Colors.grey),),
                        ),
                        Container(
                          margin:EdgeInsets.all(10.0),
                          padding: EdgeInsets.only(left: 20.0,right: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(2,10),
                          blurRadius: 10,color: Colors.black12,
                          
                        )
                      ],
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child:TextFormField(
                               validator: (val) {
                              if (val!.length > 100) {
                                return "يجب ان لايكون الأيميل اكبر من مائه حرف";
                              }
                              if (val.length < 2) {
                                return "يجب ان لايكون الايميل اصغرمن حرفين ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              gmail = val;
                            },
                            decoration: const InputDecoration(
                                hintText: "البريد الالكتروني",
                                border: InputBorder.none
                            ),
                          
                           
                          ),
                        ),
                         SizedBox(height: 20,),
                        Container(
                          margin:EdgeInsets.all(10.0),
                          padding: EdgeInsets.only(left: 20.0,right: 20.0),
                          decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(2,10),
                          blurRadius: 10,color: Colors.black12,
                          
                        )
                      ],
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child:TextFormField(
                             
                            validator: (val) {
                              if (val!.length > 100) {
                                return "يجب ان لايكون كلمه السر اكبر من رقمين";
                              }
                              if (val.length < 2) {
                                return " يجب ان لايكون كلمه السر اصغرمن رقمين   ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              mypassword = val;
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "كلمة المرور ",
                                border: InputBorder.none
                            ),
                          
                            
                          ),
                        ),
                        SizedBox(height: 30,),
                        MaterialButton(
                          onPressed: () async {
                              var user = await signup();
                             if(user != null)
                             {
                                  Navigator.of(context).pushReplacementNamed("home");
                             }
                                
                              
                             
                            },
                          child:Container(
                            alignment: Alignment.center,
                            width: 200,
                            child:Text("login".tr,
                              style:  TextStyle(fontFamily: 'Lateef-Regular',
                                  fontSize: 25),
                            ),
                            margin:EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.all( 10),
                            decoration: BoxDecoration(
                                color: AppColors.deep_orange,
                          
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                          
                          ),
                          
                          
                        ),
                          
                      ],
                    ),
                  )),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("انشاء حساب جديد",
                      style: TextStyle(color: Colors.black,
                          fontFamily: 'Lateef-Regular',
                          fontSize: 20,fontWeight: FontWeight.bold ),
        
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    GestureDetector(
                      onTap:() {
                        Navigator.of(context).pushReplacementNamed("regster");                    },
                      child:  Text( "أضغط هنا",
                          style: TextStyle(color: Colors.amberAccent, fontSize: 16.0, fontWeight:FontWeight.bold)),
                    )
                  ],
                ),
              ),
        
        
            ],
          ),
        ),
      
    );
  }
}



