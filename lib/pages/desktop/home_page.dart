import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorevue/blocs/auth/auth_bloc.dart';
import 'package:gorevue/utils/constants.dart';
import 'package:gorevue/widgets/footer.dart';
import 'package:gorevue/widgets/login_popup.dart';
import 'package:gorevue/pages/qr_scanner_page.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Revue', style: TextStyle(color: AppColors.primaryText)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Implement navigation to About Us page
            },
            child: const Text('About Us',
                style: TextStyle(color: AppColors.primaryText)),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement navigation to Blogs page
            },
            child: const Text('Blogs',
                style: TextStyle(color: AppColors.primaryText)),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement navigation to Help page
            },
            child: const Text('Help',
                style: TextStyle(color: AppColors.primaryText)),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthAuthenticated) {
                return Row(
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.qr_code_scanner,
                          color: AppColors.accent),
                      label: const Text('Scan QR',
                          style: TextStyle(color: AppColors.accent)),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
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
            const Footer(isDesktop: true),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: AppPadding.large,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Connect Creators with Brands',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'Revue bridges the gap between creators and brands, fostering successful collaborations.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/revue_logo.jpg',
              fit: BoxFit.contain,
            ),
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
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: _buildHelpCard(
                  context,
                  'Creators',
                  'Access brand deals and promotion opportunities to grow your audience and income.',
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: _buildHelpCard(
                  context,
                  'Brands',
                  'Discover and engage with influencers efficiently to boost your marketing efforts.',
                ),
              ),
            ],
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
        padding: AppPadding.large,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Text(description,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
