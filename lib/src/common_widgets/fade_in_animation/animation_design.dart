import 'package:cidade_segura2/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_screen_controller.dart';

//Classe responsavel por controlar as animções do aplicativo

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    super.key,
    required this.durationInMs,
    required this.child,
    this.animate,
  });

  //final - Declara uma variável que só pode ser atribuída uma vez e nunca será alterada
  final controller = Get.put(
      FadeInAnimationController()); //Permite injetar uma dependência no gerenciador de estado do aplicativo
  final int durationInMs; //Variavel personalizada para a duração
  final TAnimatePosition? animate; //Variavel opcional que pode ser nula
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      //Usado para reagir às alterações em um observável, que é uma variável ou objeto monitorado pelo GetX
      () => AnimatedPositioned(
        //Widget para animar a posição
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value
            ? animate!.topAfter
            : animate!
                .topBefore, //Expressão ternária '? :' para controlar a animção
        left:
            controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
        bottom: controller.animate.value
            ? animate!.bottomAfter
            : animate!.bottomBefore,
        right: controller.animate.value
            ? animate!.rightAfter
            : animate!.rightBefore,
        child: AnimatedOpacity(
          //Widget para animar a opacidade
          duration: Duration(milliseconds: durationInMs),
          opacity: controller.animate.value ? 1 : 0,
          child: child,
        ),
      ),
    );
  }
}
