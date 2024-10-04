import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gorevue/blocs/auth/auth_bloc.dart';
import 'package:gorevue/firebase_options.dart';
import 'package:gorevue/pages/desktop/home_page.dart';
import 'package:gorevue/pages/mobile/home_page.dart';
import 'package:gorevue/widgets/responsive_layout.dart';
import 'package:gorevue/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (kIsWeb) {
    usePathUrlStrategy();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Revue',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            displayLarge: AppTextStyles.headline1,
            displayMedium: AppTextStyles.headline2,
            bodyLarge: AppTextStyles.bodyText1,
          ),
          scaffoldBackgroundColor: AppColors.background,
          cardColor: AppColors.cardBackground,
        ),
        home: const ResponsiveLayout(
          mobile: MobileHomePage(),
          desktop: DesktopHomePage(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
