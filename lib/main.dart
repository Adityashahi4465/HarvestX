import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:harvestx/core/providers/cart_provider.dart';
import 'package:harvestx/features/auth/remember_me/navigation.dart';
import 'package:harvestx/features/auth/screens/login_Screen.dart';
import 'package:harvestx/features/auth/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants/shared_pref.dart';
import 'features/home/screens/for_both/cart/cart_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>Cart()),
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HarvestX',
      initialRoute: user != null ? '/navigation_to_home' : '/login_screen',
      routes: {
        // '/customer_signup': (context) => const CustomerRegister(),
        '/login_screen': (context) => const LoginPage(),
        '/register_screen': (context) => const RegisterPage(),
        '/navigation_to_home': (context) => const NavigationFromLogin(),
        // '/supplier_signup': (context) => const SupplierRegister(),
        // '/customer_home': (context) => const CustomerHomeScreen(),
        // '/supplier_home': (context) => const SupplierHomeScreen(),

        // '/edit_business': (context) => const EditBusiness(),
        // '/manage_products': (context) => const ManageProducts(),
        // '/my_store': (context) => const MyStore(),
        // 'supplier_balance': (context) => const BalanceScreen(),
        // '/supplier_orders': (context) => const SupplierOrders(),
        // '/supplier_statics': (context) => const StaticsScreen(),
        '/cart_screen': (context) => const CartScreen(),
        // '/wishlist_screen': (context) => const WishListScreen(),
        // '/customer_orders': (context) => const CustomerOrders(),
      },
    );
  }
}

