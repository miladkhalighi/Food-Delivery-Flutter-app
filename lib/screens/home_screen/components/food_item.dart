import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/colors.dart';
import '../../../models/item.dart';
import '../../details_screen/ItemDetails.dart';

class FoodItem extends StatelessWidget {
  final double width;
  final Item item;

  const FoodItem({
    Key? key,
    this.width=150,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //Get.to(()=> ItemDetailsScreen(item: item));
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ItemDetailsScreen(item: item)));
      },
      child: SizedBox(
        width: width,
        height: width * 1.55,
        child: Stack(
          children: [
            Positioned(
              top : width /4,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: width * 2 / 1.5,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 16
                      )
                    ]
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 26),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: width * 0.1,),
                    Text(item.price,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20,color: SolidColors.primaryColor),),
                    SizedBox(height: width * 0.15,)
                  ],
                ),
              ),
            ),
            //image
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Hero(
                  tag: item.id,
                  child: Container(
                    width: width - width * 0.15,
                    height: width - width * 0.15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(item.img),
                            fit: BoxFit.cover
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 32,
                              offset: const Offset(0, 16)
                          )
                        ]
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}