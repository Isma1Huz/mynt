import 'package:mynt/controller/bootom_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynt/controller/profile_screen_controller.dart';
import 'package:mynt/controller/splash_controller.dart';
import 'package:mynt/util/dimensions.dart';
import 'package:mynt/util/images.dart';
import 'package:mynt/view/base/custom_image.dart';


class AvatarSection extends StatefulWidget {
  final String image;
  const AvatarSection({ Key key, @required this.image}) : super(key: key);

  @override
  State<AvatarSection> createState() => _AvatarSectionState();
}

class _AvatarSectionState extends State<AvatarSection> {
  @override
  void initState() {
    Get.find<BottomSliderController>().isStopFun();
    Get.find<BottomSliderController>().changeAlignmentValue();
    super.initState();
  }
  @override
  void dispose() {
    Get.find<BottomSliderController>().isStopFun();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(height: 50.0),

        GetBuilder<BottomSliderController>(
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimensions.RADIUS_SIZE_OVER_LARGE,
                  height: Dimensions.RADIUS_SIZE_OVER_LARGE,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.RADIUS_SIZE_VERY_SMALL),
                    ),
                    child: CustomImage(
                      fit: BoxFit.cover,
                      image: "${Get.find<SplashController>().configModel.baseUrls.customerImageUrl
                      }/${Get.find<ProfileController>().userInfo == null ? ''
                          : Get.find<ProfileController>().userInfo.image}",
                      placeholder: Images.avatar,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  alignment: controller.alinmentRightIndicator 
                      ? Alignment.centerRight: Alignment.centerLeft,
                  width: 60.0,
                  child: Image.asset(
                    Images.slide_right_icon, height: 10, 
                    width: 10,color: Theme.of(context).textTheme.titleLarge.color,
                  )
                ),
                
                SizedBox(
                  width: Dimensions.RADIUS_SIZE_OVER_LARGE,
                  height: Dimensions.RADIUS_SIZE_OVER_LARGE,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.RADIUS_SIZE_VERY_SMALL),
                    ),
                    child: CustomImage(
                      fit: BoxFit.cover,
                      image: widget.image,
                      placeholder: Images.avatar,
                    ),
                  ),
                ),
              ],
            );
          }
        ),

        SizedBox(height: 28.0/1.7,),
      ],
    );
  }
}