import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:justpassme_flutter_example/pages/home.dart';
import 'package:justpassme_flutter/justpassme_flutter.dart';
import 'package:justpassme_flutter_example/config.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final justpassmeFlutterPlugin = JustpassmeFlutter();
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: const [
              EmailProviderConfiguration(),
            ],
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to JustPass.me, please sign in!')
                    : const Text('Welcome to JustPass.me, please sign up!'),
              );
            },
            footerBuilder: (context, action) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        final result = await justpassmeFlutterPlugin.login(loginUrl, {}) as Map;
                        String? token = result['token'] as String?;
                        if (token != null) {
                          await FirebaseAuth.instance.signInWithCustomToken(token);
                        }
                      },
                      child: const Text('Sign in with JustPass.me')));
            },
          );
        }

        return const HomeScreen();
      },
    );
  }
}