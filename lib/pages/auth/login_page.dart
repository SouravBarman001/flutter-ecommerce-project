import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../../widgets/components/login_page_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String id = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: const Color(0xffd1e5fa),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                   // height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/two.webp'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(

                  child: Stack(
                    children: [

                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                          bottomLeft: Radius.circular(35.0),
                          bottomRight: Radius.circular(35.0),
                        ),
                        child: Container(
                          color: Colors.white,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 40,right: 40,top: 30,),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  LoginPageContent(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
