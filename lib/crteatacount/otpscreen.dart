import 'dart:async';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:safer/colors/AppColor.dart';
import 'package:safer/crteatacount/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safer/pages/Home/home.dart';
class OtpScreen extends StatefulWidget {
  
   const OtpScreen({required this.verificationId,required this.isTimeOut2});
  final String verificationId;
  final bool isTimeOut2;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth auth= FirebaseAuth.instance;
  final otpcontrolr=TextEditingController();
  final otpcontrolr1=TextEditingController();
  final otpController = TextEditingController();
  bool showLoading = false;
  String verificationFailedMessage = "";
  

   String myVerificationId = "";
   bool isTimeOut = false;


  


  final formKey = GlobalKey<FormState>();

  void initState() {
   
    myVerificationId = widget.verificationId;
    isTimeOut = widget.isTimeOut2;
    super.initState();
  }



 
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: Color.fromRGBO(234, 239, 243, 1),
  ),
);
    return Scaffold(
    
      body:SafeArea (
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: 
             Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(
                   margin: EdgeInsets.only(right:15.0),
                       height: 120,
                       width: 130,
                       decoration: BoxDecoration(
                         color: AppColors.deep_orange,
                         borderRadius: BorderRadius.only(bottomRight: Radius.circular(130)
                         ,topRight: Radius.elliptical(200, 50))
                       ),
                     ),
                Container(
                  alignment: Alignment.topRight,
      
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
      
                      "التحقق ",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lateef-Regular',
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.right,
                      "تم ارسال كود التحقق الى رقم الهاتف الخاص بك ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Pinput(
             controller: otpcontrolr,
             length: 6,
             showCursor: true,
 
                     ),
              ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            "اذا لم تصلك رسالة أنقر هنااا ",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lateef-Regular',
                              fontSize: 30,)
                          ),
      
                        ),
                      ),
                      TextButton(
                          onPressed:()async {
                              PhoneAuthCredential credential =
                               PhoneAuthProvider.credential(
                                 verificationId: widget.verificationId, smsCode: otpcontrolr.text,);

    // Sign the user in (or link) with the credential
                              await auth.signInWithCredential(credential);
                              if(auth.currentUser != null)
                              {
                                ArtSweetAlert.show(
                                     context: context,
                          artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.success,
                          title: "تم",
                      text: "تم انشاء الحساب بنجاح ",
                      onConfirm: (){
                          Navigator.of(context).pushReplacementNamed("home");
                      }
                         )
                           );         
                                
                              }
                            
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            child: Text(
                              "تسجيل",
                              style: TextStyle(
                        fontSize: 20,
      
                        color: Colors.black,
                                fontWeight: FontWeight.bold,
                      ),),
                            margin:EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.all( 10),
                            decoration: BoxDecoration(
                                color: AppColors.deep_orange,
      
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                          ))
                    ],
                  ),
                ),
              ],
                  ),
                ),
        ),
      

        );


  }
}
