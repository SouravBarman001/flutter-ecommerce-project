import 'package:flutter/material.dart';


class LoginPageContent extends StatefulWidget {
  const LoginPageContent({super.key});

  @override
  State<LoginPageContent> createState() => _LoginPageContentState();
}

class _LoginPageContentState extends State<LoginPageContent> {
  final navigatorKey = GlobalKey<NavigatorState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String? emailValue;
  String? passValue;


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


    return Column(
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
        TextField(
          controller: emailController,
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
        TextField(
          controller: passController,
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
               //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePageProduct()));
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
        const SizedBox(height: 25,),
        // const SizedBox(),
      ],
    );
  }
}
// backgroundColor: const Color(0xffffd0bc),

// here you can stored shared-preferences value
// value stored
// var emailText = await SharedPreferences.getInstance();
//   // emailText.setString(loginEmail, emailValue!);
//
// var passText = await SharedPreferences.getInstance();

// String? storedEmail = emailText.getString(loginEmail);
// String? storedPass = passText.getString(loginPass);
//
//   print('Email : $storedEmail');
//   print('Email : $storedPass');

// if(storedEmail == emailController.text && storedPass == passController.text){

// navigatorKey.currentState?.push(
//   MaterialPageRoute(
//     builder: (context) => const MyHomePage(),
//   ),
// );

//   navigateToHomePage();

//
//   print('inside the condition');
//
// }else{
//   print('Please enter correct email and pass');
// }