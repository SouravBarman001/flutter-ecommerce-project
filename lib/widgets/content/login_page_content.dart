
import 'package:flutter/material.dart';
import '../../apis/login_apis.dart';
import '../../pages/general/home_page.dart';


class LoginPageContent extends StatefulWidget {
  const LoginPageContent({super.key});

  @override
  State<LoginPageContent> createState() => _LoginPageContentState();
}

class _LoginPageContentState extends State<LoginPageContent> {

  // Initialize SharedPreferences

  final navigatorKey = GlobalKey<NavigatorState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? emailValue;
  String? passValue;

  // Navigate to home page
  void navigateToHomePage(){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=>const HomePage()));
  }

  // show snake bar

  void showSnakeBar(BuildContext context,String msg){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(backgroundColor:Colors.redAccent,
          content: Text('Please Enter Valid Email & Password')),
    );
  }

  Future<void> userLogin(String emailController, String passController) async {
    bool loggIn = await LoginApis.loginPerform(emailController,passController);
    if(loggIn){
      print('Login Successfully');
      navigateToHomePage();
    }
  }

  Widget buildCustomPrefixIcon({required IconData iconfrom}) {
    return Container(
      //  margin: const EdgeInsets.only(top: 10),
      width: 0,
      alignment: const Alignment(-0.99, 0.0),
      child:  Icon(iconfrom),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome Back!",
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),

            ],
          ),
          const SizedBox(height: 20,),
          const Text('Email'),
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration:  InputDecoration(
              //labelText: 'Email',
              //  contentPadding:  const EdgeInsets.only(bottom: 10.0),
              prefixIcon: buildCustomPrefixIcon(iconfrom :Icons.email_outlined),
            ),
            onChanged: (value) async {
              setState(() {
                emailValue = value.toString();

              });

            },
          ),
          const SizedBox(
            height: 10.0,
          ),

          const SizedBox(
            height: 25.0,
          ),
          const Text('Password'),
          TextFormField(
            controller: passController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: (value){
              setState(() {
                passValue = value;
              });
            },
            decoration:  InputDecoration(
              //labelText: 'Email',
              // contentPadding:  const EdgeInsets.only(bottom: -10.0),
              prefixIcon: buildCustomPrefixIcon(iconfrom :Icons.key_outlined),
            ),
          ),
          const SizedBox(
            height: 25,
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: (){
                   //Get.to(()=>const HomePage(),transition: Transition.zoom);
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                     userLogin(emailController.text.toString(),passController.text.toString());

                      // print(emailController.text.toString());
                      // print(passController.text.toString());


                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(backgroundColor:Colors.cyan,
                            content: Text('Processing Data')),
                      );
                    }
                   // Navigator.pushReplacement(context,
                   //     MaterialPageRoute(builder: (context)=>const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(

                    backgroundColor: const Color(0xff0096e0),
                    padding: const EdgeInsets.all(18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  child: const Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                ),

              ),

            ],
          ),
          const SizedBox(height: 20,),
          // const SizedBox(),
        ],
      ),
    );
  }
}
