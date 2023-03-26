import 'package:harvestx/core/common/loder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../features/auth/controller/auth_controller.dart';
import '../../theme/pallet.dart';
import '../constants/constants.dart';

class SignInButton extends ConsumerWidget {
  SignInButton({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return isLoading
        ? const Loader()
        : Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton.icon(
              onPressed: () => signInWithGoogle(context, ref),
              icon: Image.asset(
                Constants.googlePath,
                width: 35,
              ),
              label: const Text(
                'Continue with Google',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.pink,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          );
  }
}
