import 'package:flutter/material.dart';

import 'count_down_timer.dart';

class HappyHourTime extends StatefulWidget {
  const HappyHourTime({super.key});

  @override
  State<HappyHourTime> createState() => _HappyHourTimeState();
}

class _HappyHourTimeState extends State<HappyHourTime> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(left: 10,),
       height: 40,
       width: double.infinity,
      color: const Color(0xffebecf0),
      child:  const Row(
        children: [
         Text("HAPPY HOUR", style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        ),),
          Padding(
            padding: EdgeInsets.only(top: 8,left: 10),
            child: CountDownTimer(),
          ),
        ],
      ),
    );
  }
}
