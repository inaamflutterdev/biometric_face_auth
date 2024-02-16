// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthenticationButton extends StatefulWidget {
  const BiometricAuthenticationButton({Key? key}) : super(key: key);

  @override
  State<BiometricAuthenticationButton> createState() =>
      _BiometricAuthenticationButtonState();
}

class _BiometricAuthenticationButtonState
    extends State<BiometricAuthenticationButton> {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<void> _authenticate(BuildContext context) async {
    try {
      bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate to access the app',
        // You may not need these parameters if they are not available in the latest version.
        // biometricOnly: true,
        // useErrorDialogs: true,
      );

      if (isAuthenticated) {
        print('User authenticated successfully!');
      } else {
        print('Authentication failed or canceled by the user.');
      }
    } catch (e) {
      print('Error during authentication: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _authenticate(context),
      child: const Text('Authenticate with Biometrics'),
    );
  }
}
