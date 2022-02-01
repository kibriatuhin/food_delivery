import 'package:flutter/material.dart';
class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController controller = PageController(viewportFraction: 0.86);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: PageView.builder(
        controller: controller,
          itemCount: 5,
          itemBuilder: (context , index){
        return _buildPageItems(index);
      }),
    );
  }

  Widget _buildPageItems(int index){
    return Stack(
      children: [
        Container(
          height: 200,
          margin: EdgeInsets.only(left: 15,right: 15),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png")
            ),
            borderRadius: BorderRadius.circular(30),
            color: Colors.black54,
          ),

        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 130,
            margin: EdgeInsets.only(left: 30,right: 30,bottom: 20),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),

          ),
        )
      ],
    );
  }
}
