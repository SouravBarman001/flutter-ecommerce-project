import 'package:flutter/material.dart';

import '../../widgets/appbar_action_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose the focus node to avoid memory leaks
    super.dispose();
  }
  void _unfocusKeyboard() {
    _focusNode.unfocus();
  }

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap:()=> _unfocusKeyboard(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffdf0100),
            actions: const [
              AppBarActionWidgets(),
            ],

          ),
          body:  const Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}



