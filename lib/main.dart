import 'package:food_allergens/layout/screen_layout.dart';
import 'package:food_allergens/model/product_model.dart';
import 'package:food_allergens/providers/user_details_provider.dart';
import 'package:food_allergens/screens/product_screen.dart';
import 'package:food_allergens/screens/results_screen.dart';
import 'package:food_allergens/screens/sell_screen.dart';
import 'package:food_allergens/screens/sign_in_screen.dart';
import 'package:food_allergens/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyC8SbtwozqLn0o6Q_SUJ20uJeciCxxoESY",
      authDomain: "food-allergence-app.firebaseapp.com",
      databaseURL:
          "https://food-allergence-app-default-rtdb.asia-southeast1.firebasedatabase.app",
      projectId: "food-allergence-app",
      storageBucket: "food-allergence-app.appspot.com",
      messagingSenderId: "264644162454",
      appId: "1:264644162454:web:b797fec484c7504f8563b7",
      measurementId: "G-28LLPS6SW6",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const FoodAllergence());
}

class FoodAllergence extends StatelessWidget {
  const FoodAllergence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserDetailsProvider())],
      child: MaterialApp(
        title: "Amazon Clone",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> user) {
              if (user.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              } else if (user.hasData) {
                return const ScreenLayout();
                //return const SellScreen();
              } else {
                return const SignInScreen();
              }
            }),
      ),
    );
  }
}
