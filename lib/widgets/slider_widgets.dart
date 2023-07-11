import 'package:flutter/material.dart';

class SliderWidgets extends StatefulWidget {
  const SliderWidgets({super.key});

  @override
  State<SliderWidgets> createState() => _SliderWidgetsState();
}

class _SliderWidgetsState extends State<SliderWidgets> {

  int currentIndex = 0;

  List<String> images = [
    'images/banner/banner3.jpg',
    'images/banner/banner4.jpg',
    'images/banner/banner5.jpg',
    'images/banner/banner6.jpg',
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      SizedBox(
      height: 180,
      width: double.infinity,
      child: PageView.builder(
        onPageChanged: (index){
          setState(() {
            currentIndex = index % images.length;
          });
        },
        //itemCount: images.length,
        itemBuilder: (context, index) {
          final imagePath = images[index % images.length]; // Store the image path in a local variable
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:8,vertical: 12),
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Adjust the radius value as per your preference
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            )

          );
        },
      ),
    ),

        const SizedBox(height: 1,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(var i = 0;i<images.length;i++)
                buildIndicator(currentIndex == i)

          ],
        )
    ],
    );
  }
  Widget buildIndicator(bool isSelected){
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: Container(
        height: isSelected ? 10 : 10,
        width: isSelected ? 10 : 10,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? const Color(0xffde0201) : const Color(0xffd9d9d9)
        ),
      ),
    );
  }


}
