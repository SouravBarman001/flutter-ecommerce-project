import 'package:flutter/material.dart';

import 'content/count_down_timer.dart';

class HappyHourTime extends StatefulWidget {
  const HappyHourTime({super.key});

  @override
  State<HappyHourTime> createState() => _HappyHourTimeState();
}

class _HappyHourTimeState extends State<HappyHourTime> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(left: 14,),
       height: 45,
       width: double.infinity,
      color: const Color(0xffebecf0),
      child:  const Row(
        children: [
         Text("HAPPY HOUR", style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        ),),
          Padding(
            padding: EdgeInsets.only(top: 10,left: 10),
            child: CountDownTimer(),
          ),
        ],
      ),
    );
  }
}
