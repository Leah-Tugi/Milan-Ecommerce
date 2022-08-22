import 'package:get/get.dart';
class Dimensions{
 static double screenHeight = Get.context!.height;
 static double screenWidth = Get.context!.width;

 static double pageView = screenHeight/2.36;
 static double pageViewContainer = screenHeight/3.44;
 static double pageViewTextContainer = screenHeight/6.3;
//dynamic height padding and margin
 static double height10 = screenHeight/75.6;
 static double height15 = screenHeight/50.4;
 static double height20 = screenHeight/37.8;
 static double height30 = screenHeight/25.2;
 static double height45 = screenHeight/16.8;
//dynamic width padding and margin
 static double width10 = screenWidth/75.6;
 static double width15 = screenWidth/50.4;
 static double width20 = screenWidth/37.8;
 static double width30 = screenWidth/25.2;
 static double width45 = screenWidth/16.8;

//font size
 static double font20 = screenHeight/37.8;
 static double font26 = screenHeight/29.08;

 static double radius15 = screenHeight/50.4;
 static double radius20 = screenHeight/37.8;
 static double radius30 = screenHeight/25.2;

 //icon size
static double iconSize24 = screenHeight/ 31.5;
 static double iconSize16 = screenHeight/ 47.25;

//list view size
static double listViewImgSize = screenWidth/3;
static double listViewTextContSize = screenWidth/3.6;

//popular food
static double popularFoodImgSize=screenHeight/2.16;

//bottom height
static double bottomHeightBar = screenHeight/6.3;
}