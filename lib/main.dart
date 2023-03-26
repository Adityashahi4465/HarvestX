import 'package:harvestx/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/common/errorText.dart';
import 'core/common/loder.dart';
import 'firebase_options.dart';
import 'package:routemaster/routemaster.dart';

import 'models/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;
  void getData(WidgetRef ref, User data) async {
    print('getData called');
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.email.toString())
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
  }

  @override
  Widget build(BuildContext context) {
    print('userModel in build: $userModel');

    return ref.watch(authStateChangeProvider).when(
          data: (data) => MaterialApp.router(
            // if The data available means user is logged in
            debugShowCheckedModeBanner: false,
            title: 'AttainFinance',

            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                actionsIconTheme: IconThemeData(
                  color: Colors.black54,
                ),
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            routerDelegate: RoutemasterDelegate(
              routesBuilder: (context) {
                if (data != null) {
                  print('data != null ? : $data');
                  // if (userModel != null) {
                  if (ref.watch(userProvider) != null) {
                    print(
                        'userProvider.notifier: ${ref.read(userProvider.notifier)}');
                    return loggedInRouter;
                    // }
                  } else {
                    getData(ref, data);
                  }
                }
                return loggedOutRouter;
              },
            ),
            routeInformationParser: const RoutemasterParser(),
          ),
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}
