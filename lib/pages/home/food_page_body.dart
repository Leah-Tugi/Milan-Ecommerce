import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milan_ecommerce/utils/colors.dart';
import 'package:milan_ecommerce/utils/dimensions.dart';
import 'package:milan_ecommerce/widgets/app_column.dart';
import 'package:milan_ecommerce/widgets/big_text.dart';
import 'package:milan_ecommerce/widgets/icon_and_text.dart';
import 'package:milan_ecommerce/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageValue = 0.0;
  double scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
        // print("Current page value is" + currPageValue.toString());
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose()
;  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          //color: Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context,position){
                return _buildPageItem(position);
              }),
        ),
    //dots
    new DotsIndicator(
    dotsCount: 5,
    position: currPageValue,
    decorator: DotsDecorator(
      activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
        //popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom:3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom:2),
                child: SmallText(text: "Food Pairing", color: Colors.black26),
              ),

            ],
            
          ),

        ),
        //list of food and images

           ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
    itemCount: 10,
    itemBuilder:(context, index) {
    return Container(
    margin: EdgeInsets.only(left:Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
    child: Row(
    children: [
    Container(
      width:Dimensions.listViewImgSize,
    height: Dimensions.listViewImgSize,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(Dimensions.radius20),
    color: Colors.white38,
    image: DecorationImage(
      fit:BoxFit.cover,
    image: AssetImage(
    "assets/image/food02.jpg"
    ),
    )

    ),
    ),
      //text container
      Expanded(
          child: Container(
        height: Dimensions.listViewTextContSize,
           // width: Dimensions.listViewTextContSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius20),
            bottomRight: Radius.circular(Dimensions.radius20),
          ),
          color: Colors.white,
        ),
            child: Padding(
              padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(text: "Nutritious pizza in Kenya"),
                  SizedBox(height: Dimensions.height10),
                  SmallText(text: "With kenyan characteristics"),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(icon: Icons.circle_sharp,
                          text: "Normal",

                          iconColor: AppColors.iconColor1),
                      SizedBox(width:10),
                      IconAndTextWidget(icon: Icons.location_on,
                          text: "1.7km",

                          iconColor: AppColors.mainColor),
                      SizedBox(width:10),
                      IconAndTextWidget(icon: Icons.access_time_rounded,
                          text: "32min",

                          iconColor: AppColors.iconColor2)
                    ],
                  )
                ],
              ),
            ),
      ),
      ),
    ],
    ),
    );
    }),



      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if (index == currPageValue.floor())
     {
       var currScale = 1-(currPageValue - index)*(1 - scaleFactor);
       var currTrans = height * (1- currScale)/2;
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currScale, 0);
     }
    else if( index == currPageValue.floor() + 1){
      var currScale = scaleFactor +(currPageValue -  index+1)* (1-scaleFactor);
      var currTrans = height * (1- currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currScale, 0);
    }
    else if( index == currPageValue.floor() - 1){
      var currScale = 1 - (currPageValue -  index)* (1-scaleFactor);
      var currTrans = height * (1- currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currScale, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currScale, 0); ;
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left:Dimensions.width10,right:Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Color(0xFF69c5df): Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/image/food02.jpg"
                    )

                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left:Dimensions.width30,right:Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                   color: Color(0xFFe8e8e8),
                     blurRadius: 5.0,
                     offset: Offset(0, 5)

                   ),
                   BoxShadow(
                     color: Colors.white,
                     offset:Offset(-5,0)
                   ),


                 ]

                  ),
              child:Container(
                  padding:EdgeInsets.only(top: Dimensions.height15, left:Dimensions.width15, right: Dimensions.width15),
                  child: AppColumn( text: "Chinese Side"),
              ),

              ),
            ),

        ],
      ),
    );
  }
}
