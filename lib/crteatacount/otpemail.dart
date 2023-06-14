import 'dart:async';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:safer/colors/AppColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_otp/email_otp.dart';

class Otp extends StatelessWidget {
  const Otp({
    Key? key,
    required this.otpController,
  }) : super(key: key);
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: otpController,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          
        ),
        onSaved: (value) {},
      ),
    );
  }
}
class OtpEmail extends StatefulWidget {
   OtpEmail({ required this.myauth,});
 
final EmailOTP myauth ;


  @override
  State<OtpEmail> createState() => _OtpEmailState();
}

class _OtpEmailState extends State<OtpEmail> {
 
   final FirebaseAuth auth= FirebaseAuth.instance;
final  TextEditingController otpController = TextEditingController();
  

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

 


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
    return  Scaffold(
    
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
                      "تم ارسال كود التحقق الى الايميل الخاص بك ",
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
             controller: otpController,
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
                            "اذا لم تصلك رسالة أنقر هنا ",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lateef-Regular',
                              fontSize: 30,)
                          ),
      
                        ),
                      ),
                      TextButton(
                           onPressed: () async {
            if (await widget.myauth.verifyOTP(otp: otpController.text ) == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("تم ارسال كود التحقق الى بريدك الالكتروني"),
                ));
                 ArtSweetAlert.show(
                                     context: context,
                          artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.success,
                          title: "تم",
                      text: "تم انشاء الحساب بنجاح ",
                      onConfirm: (){
                          Navigator.of(context).pushReplacementNamed("login");}));
              } else {
                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                  content: ArtSweetAlert.show(
                                     context: context,
                          artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.warning,
                          title: "تم",
                      text: "كود التحقق غير صحيح الرجاء المحاوله مره اخرى",))
                ));
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