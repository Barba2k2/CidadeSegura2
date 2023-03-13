import 'package:cidade_segura2/error_page.dart';
import 'package:cidade_segura2/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:cidade_segura2/src/features/authentication/services/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        // home: const ErrorPage(),
        home: FutureBuilder(
          future: _inicializacao,
          builder: (context, app) {
            if (app.connectionState == ConnectionState.done) {
              return const BottomNavBar();
            }
    
            if (app.hasError) return const ErrorPage();
    
            return const SplashScreen();
          },
        ),
      ),
    );
  }
}
