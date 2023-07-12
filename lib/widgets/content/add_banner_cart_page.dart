import 'package:flutter/material.dart';

class AddBanner extends StatelessWidget {
  const AddBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7,bottom: 7,),
      color: const Color(0xff9de6b4),
      width: double.infinity,
      // height: 20,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Shop more 200tk to get free delivery',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}
