import 'package:cidade_segura2/error_page.dart';
import 'package:cidade_segura2/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'src/features/core/bottom_nav_bar.dart';
import 'src/repositories/authentication_repository/authentication_repository.dart';
import 'src/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (value) => Get.put(AuthenticationRepository()),
  );

  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _inicializacao = Firebase.initializeApp();
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( //Widget Meterial App do Pacote Get
      debugShowCheckedModeBanner: false, //Banner de Debug
      theme: TAppTheme.lightTheme, //Tema claro
      darkTheme: TAppTheme.darkTheme, //Tema escuro
      themeMode: ThemeMode.system, //Tema do sistema (claro ou escuro)
      defaultTransition: Transition.leftToRightWithFade, //Estilo da Transição/Animação
      transitionDuration: const Duration(milliseconds: 500), //Tempo da transição
      home: FutureBuilder(
        future: _inicializacao,
        builder: (context, app) {
          if (app.connectionState == ConnectionState.done) { //Verifica se o usuário esta logado
            return const BottomNavBar(); //Se verdadeiro entra no aplicativo
          }

          if (app.hasError) return const ErrorPage(); //Se ocorrer um erro direciona para a pagina de erro

          return const SplashScreen(); //Se falso, retorna a pagina inicial do app
        },
      ),
    );
  }
}
