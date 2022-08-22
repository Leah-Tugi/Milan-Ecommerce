import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milan_ecommerce/widgets/big_text.dart';
import 'package:milan_ecommerce/widgets/small_text.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    //print("current height is"+ MediaQuery.of(context).size.height.toString());
    //print("current width is"+ MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
        //showing the header
          Container(
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15,),
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                       children: [
                       BigText(text: "Kenya", color:AppColors.mainColor),
                        Row(
                          children: [
                            SmallText(text: "Nairobi", color: Colors.black54),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        ),

                      ],
                    ),

                    Center(
                    child:Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search,color: Colors.white, size: Dimensions.iconSize24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                    ),
                  ],
                ),
              )
          ),
          //showing the body
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
