import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorevue/blocs/auth/auth_bloc.dart';
import 'package:gorevue/utils/constants.dart';
import 'package:gorevue/widgets/drawer_menu.dart';
import 'package:gorevue/widgets/footer.dart';
import 'package:gorevue/widgets/login_popup.dart';
import 'package:gorevue/pages/qr_scanner_page.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Revue', style: TextStyle(color: AppColors.primaryText)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryText),
        actions: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthAuthenticated) {
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.qr_code_scanner,
                          color: AppColors.accent),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const QRScannerPage(),
                        ));
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(SignOut());
                      },
                      child: const Text('Logout',
                          style: TextStyle(color: AppColors.accent)),
                    ),
                  ],
                );
              } else {
                return TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const LoginPopup(),
                    );
                  },
                  child: const Text('Login',
                      style: TextStyle(color: AppColors.accent)),
                );
              }
            },
          ),
        ],
      ),
      drawer: const DrawerMenu(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildHeroSection(context),
                      _buildVisionSection(context),
                      _buildHelpSection(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Footer(isDesktop: false),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: AppPadding.large,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Connect Creators with Brands',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Revue bridges the gap between creators and brands, fostering successful collaborations.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildVisionSection(BuildContext context) {
    return Container(
      padding: AppPadding.large,
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Our Vision',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'To create a world where creators and brands can easily connect, collaborate, and grow together.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection(BuildContext context) {
    return Container(
      padding: AppPadding.large,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'How Revue Helps',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          _buildHelpCard(
            context,
            'Creators',
            'Access brand deals and promotion opportunities to grow your audience and income.',
          ),
          const SizedBox(height: 16),
          _buildHelpCard(
            context,
            'Brands',
            'Discover and engage with influencers efficiently to boost your marketing efforts.',
          ),
        ],
      ),
    );
  }

  Widget _buildHelpCard(
      BuildContext context, String title, String description) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: AppPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(description,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
