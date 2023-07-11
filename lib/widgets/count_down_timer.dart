import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({super.key});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {

  Duration duration = const Duration();
  Timer? timer;
  bool isCountDown = true;
  static const countDownDuration = Duration(minutes: 10);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    reset();
  }
  void addTime(){
    final addSeconds = isCountDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if(seconds == 0){
        timer!.cancel();
      }
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer(){
    timer = Timer.periodic(const Duration(seconds: 1),(_)=>addTime());
  }

  void reset(){
    if(isCountDown){
      setState(() {
        duration =  countDownDuration;
      });
    }else{
      setState(() {
        duration = const Duration();
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return buildTime();
  }

  Widget buildTime(){

    String towDigits(int n) => n.toString().padLeft(2,'0');
    final hours = towDigits(duration.inHours);
    final minutes = towDigits(duration.inMinutes.remainder(60));
    final seconds = towDigits(duration.inSeconds.remainder(60));

    return Row(
      children: [
        buildTimeCard(timer: hours,header: 'Hours'),
        const SizedBox(width: 8,),
        buildTimeCard(timer: minutes,header: 'Minutes'),
        const SizedBox(width: 8,),
        buildTimeCard(timer: minutes,header: 'Seconds'),
      ],
    );
  }
  
  Widget buildTimeCard({required String timer, required String header}){
     return Column(
       children: [
         Container(
           padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 2),
           decoration:  BoxDecoration(
             color: const Color(0xffe20102),
             borderRadius: BorderRadius.circular(2),
           ),
           child: Column(
             children: [
               Text(
                 timer,
                 style: const TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                  // fontSize: 50,
                 ),
               ),
               Text(header,style: const TextStyle(
                 fontSize: 5,color: Colors.white,
               ),),
             ],
           ),
         ),

       ],
     );
  }
  

}
