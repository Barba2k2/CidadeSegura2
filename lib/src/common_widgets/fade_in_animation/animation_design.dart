import 'package:cidade_segura2/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_screen_controller.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    super.key,
    required this.durationInMs,
    required this.child,
    this.animate,
  });

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value ? animate!.topAfter : animate!.topBefore,
        left:
            controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
        bottom: controller.animate.value
            ? animate!.bottomAfter
            : animate!.bottomBefore,
        right: controller.animate.value
            ? animate!.rightAfter
            : animate!.rightBefore,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMs),
          opacity: controller.animate.value ? 1 : 0,
          child: child,
          // child: const Image(
          //   image: AssetImage(tSplashTopIcon),
          // ),
        ),
      ),
    );
  }
}
