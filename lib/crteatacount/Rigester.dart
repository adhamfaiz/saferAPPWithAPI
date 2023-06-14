
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safer/crteatacount/otpemail.dart';
import 'package:safer/crteatacount/otpscreen.dart';
import 'package:safer/crteatacount/valadit.dart';
import '../colors/AppColor.dart';
import 'package:email_otp/email_otp.dart';
class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _LoginState();
}

class _LoginState extends State<Register> {


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      
      body:SafeArea(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                         margin: EdgeInsets.only(right:50),
                        child: const Text("إنشاء ",
                          style: TextStyle(color: Colors.black,
                            fontFamily: 'Lateef-Regular',
                            fontSize: 40,fontWeight: FontWeight.bold),),
      
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30.0,right:80),
                        child: const Text(" حساب جديد عن طريق",
                          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,
                              color: Colors.grey),),
                      ),
                      SizedBox(height: 10,),
                      
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 500,
                            child: Valadit()),
                        )
      
                    ],
                    
                  )),
             
       Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text("already_have_an_account?".tr),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("login");
                                  },
                                  child: Text(
                                    "Click_Here".tr,
                                    style: TextStyle(color: AppColors.deep_orange),
                                  ),
                                ),
                              ],
                            )),
      
            ],
          ),
        ),
      
    );
  }
}


class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {

 TextEditingController email = TextEditingController();
  EmailOTP myauth = EmailOTP();
     var username, mypassword, gmail;

  GlobalKey<FormState> forms = GlobalKey<FormState>();
   signups() async {
    var formedata = forms.currentState;
    if (formedata!.validate()) {
      formedata.save();
      try {
        UserCredential usercredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: gmail,
          password: mypassword,
         
        );
        return usercredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              context: context,
              title: "erorr",
              body: Text("كلمه السر المدخله ضعيفه ادخل كلمه سر قويه"))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              context: context,
              title: "erorr",
              body: Text("هاذا الحساب قد تم انشاءه مسبقا"))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("not valid");
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: forms,
      child: ListView(
        
     children: [
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
                                return "يجب ان لايكون اسم المستخدم اكبر من مائه حرف";
                              }
                              if (val.length < 2) {
                                return "يجب ان لايكون اسم المستخدم اصغرمن حرفين ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              username = val;
                            },
                           
                            decoration: const InputDecoration(
                                hintText: "اسم المستخدم",
                                border: InputBorder.none
                            ),
        
                          ),
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
                             controller: email,
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
                        SizedBox(height: 10,),
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
                                return "يجب ان يكون كلمه السر اكبر من رقمين";
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
                        SizedBox(height: 10,),
                       
                        SizedBox(height: 20,),
        
                        MaterialButton(
                          onPressed: () async {
                             UserCredential response =await signups();
                            print("===================");
                            if(response != null)
                            {
                          myauth.setConfig(
                              appEmail: "contact@hdevcoder.com",
                              appName: "Email OTP",
                              userEmail: email.text,
                              otpLength: 6,
                              otpType: OTPType.digitsOnly);
                          if (await myauth.sendOTP() == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>   OtpEmail(myauth:myauth)));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ));
                          }
                        
                            }
                          },
        
                          child:Container(
                            alignment: Alignment.center,
                            width: 150,
                            child: const Text("إنشاءحساب ",
                              style: TextStyle(fontFamily: 'Lateef-Regular',
                                fontSize: 25,),
                            ),
                            margin:EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.all( 10),
                            decoration: BoxDecoration(
                                color: AppColors.deep_orange,
        
                                borderRadius: BorderRadius.circular(20.0)
                            ),
        
                          ),
        
        
                        )
     ],
      ),
    );
  }
}
class Phonenumber extends StatefulWidget {
  const Phonenumber({super.key});

  @override
  State<Phonenumber> createState() => _PhonenumberState();
}

class _PhonenumberState extends State<Phonenumber> {
  var username, mypassword, gmail;
    String textNumberPhone = '';
  String dialCodeInitial = '+967';
    String verificationFailedMessage = "";
    bool showLoading = false;
var phone="";
  @override
 void initState() {
    // TODO: implement initState
    otpcontrolr1.text='+967';
    super.initState();
  }
  String result = '';
 final otpcontrolr1=TextEditingController();
  GlobalKey<FormState> forms = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: forms,
      child: ListView(
        
     children: [
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
                            keyboardType: TextInputType.phone,
                            onChanged: ((value) =>phone=value ),
                            
                           
                        
                            decoration:  InputDecoration(
                              suffix: Text("|967+"),
                      
                                hintText: "أدخل رقم الهاتف",
                                border: InputBorder.none
                               
                            ),
        
                          ),
                        ),
                     
                        SizedBox(height: 10,),
                       
                        SizedBox(height: 20,),
        
                        MaterialButton(
                          onPressed: ()async  {
                                  setState(() {
                          showLoading = true;
                        }); 
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '${otpcontrolr1.text+phone}',
                            verificationCompleted: (PhoneAuthCredential credential) {},
                           verificationFailed: (FirebaseAuthException e) {
                                 setState(() {
                              showLoading = false;
                            });
                            setState(() {
                              verificationFailedMessage = e.message ?? "error!";
                            });
                
                           },
                           codeSent: (String verificationId, int? resendToken) {
                              setState(() {
                              showLoading = false;
                            });
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>OtpScreen(isTimeOut2: false,verificationId:verificationId)));
                           },
                             timeout: const Duration(seconds: 10),
                           codeAutoRetrievalTimeout: (String verificationId) {
                               Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=>OtpScreen(isTimeOut2:true,verificationId:verificationId)));
                           },
);
                                
                              },
        
                          child:Container(
                            alignment: Alignment.center,
                            width: 150,
                            child: const Text("إنشاءحساب ",
                              style: TextStyle(fontFamily: 'Lateef-Regular',
                                fontSize: 25,),
                            ),
                            margin:EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.all( 10),
                            decoration: BoxDecoration(
                                color: AppColors.deep_orange,
        
                                borderRadius: BorderRadius.circular(20.0)
                            ),
        
                          ),
        
        
                        )
     ],
      ),
    );
  }
}
