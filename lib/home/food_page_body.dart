import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

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
      height: 280,
      child: PageView.builder(
          controller: controller,
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildPageItems(index);
          }),
    );
  }

  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 180;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        _currentPageValue = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
  }

  Widget _buildPageItems(int index) {

    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - currentScale) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 180,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png")),
              borderRadius: BorderRadius.circular(30),
              color: Colors.black54,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffeeecec),
                    //color: Colors.black,
                    blurRadius: 5,
                    offset: Offset(0,5)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5,0)
                  ),
                  BoxShadow(
                      color:Colors.white,
                      offset: Offset(5,0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(left: 15,right: 15,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Chinese Side',),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: 16,)),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: '4.5',),
                        SizedBox(width: 10,),
                        SmallText(text: "1287"),
                        SizedBox(width: 5,),
                        SmallText(text: "comments")
                      ],
                    ),
                    SizedBox(height: 18,),
                    Row(
                      children: [
                        IconAndText(icon: Icons.circle, iconColor: AppColors.iconColor1, text: "Normal"),
                        SizedBox(
                          width: 7,
                        ),
                        IconAndText(icon: Icons.location_on, iconColor: AppColors.mainColor, text: "1.7km"),
                        SizedBox(
                          width: 7,
                        ),
                        IconAndText(icon: Icons.access_time, iconColor: AppColors.iconColor2, text: "32min"),
                      ],
                    )


                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
