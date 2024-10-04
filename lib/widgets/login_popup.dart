import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorevue/blocs/auth/auth_bloc.dart';
import 'package:gorevue/utils/constants.dart';

class LoginPopup extends StatelessWidget {
  const LoginPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: AppPadding.large,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Sign In', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignInWithGoogle());
                Navigator.of(context).pop();
              },
              child: const Text('Sign In with Google'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
