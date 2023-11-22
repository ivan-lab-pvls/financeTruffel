import 'package:as_fin/app_theme.dart';
import 'package:as_fin/ext.dart';
import 'package:as_fin/pages/educations_page/educations_page.dart';
import 'package:as_fin/router.dart';
import 'package:as_fin/widgets_global/main_button.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  var _inited = false;
  late final SharedPreferences _sharedPrefs;
  final inAppReview = InAppReview.instance;

  String? premiumId;

  String l = '';
  List<String> posters = [];
  List<bool> cccheck = [true, true];

  @override
  void initState() {
    super.initState();
    _strt();
  }

  void _strt() {
    _sharedPrefs = context.read<SharedPreferences>();
    str(_sharedPrefs);

    final premId = FirebaseRemoteConfig.instance.getString('activity');

    if (!premId.contains('isActive')) {
      setState(() {
        premiumId = premId;
        _inited = true;
      });
      return;
    }

    final boarding = _sharedPrefs.getBool('isBoardingDone') ?? false;

    if (!boarding) {
      setState(() {
        _inited = true;
      });
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(Routes.atHome);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_inited) {
      return SplashScreen();
    }

    if (premiumId != null) {
      return PremScreen(s: premiumId!);
    }
    return Boarding();
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.green,
      body: Center(
        child: Image.asset(
          'pics/logo_pic.png',
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}

class Boarding extends StatefulWidget {
  const Boarding({super.key});

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  late final SharedPreferences _bd;
  final PageController _contrl = PageController();

  @override
  void initState() {
    super.initState();
    _bd = context.read<SharedPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _contrl,
        children: [
          SubBoarding(
            title: 'Comprehensive Financial Education',
            subtitle:
                'From budgeting basics to advanced investment strategies, the app provides a comprehensive learning hub that caters to users of all financial literacy levels.',
            child: Image.asset(
              'pics/board_1.png',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            onTap: () {
              _contrl.nextPage(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.linear);
            },
          ),
          SubBoarding(
            title: 'We value your feedback!',
            subtitle:
                'Every day we are getting better due to your ratings and reviews — that helps us protect your accounts.',
            onTap: () async {
              await _bd.setBool('isBoardingDone', true);
              context.go(Routes.atHome);
            },
            sec: true,
            child: Image.asset(
              'pics/board_2.png',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          )
        ],
      ),
    );
  }
}

class SubBoarding extends StatelessWidget {
  const SubBoarding({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.onTap,
    this.sec = false,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final VoidCallback onTap;
  final bool sec;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 4,
                width: 80,
                decoration: BoxDecoration(
                  color: sec
                      ? Theme.of(context).primaryColor
                      : const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
          const Spacer(),
          child,
          const Spacer(),
          Text(
            title,
            style: context.textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: context.textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          MainButton(
            width: MediaQuery.of(context).size.width * 0.8,
            title: 'Continue',
            onTap: onTap,
          ),
          const Spacer(),
          Text(
            'Terms of use  |  Privacy Policy',
            style: context.textTheme.titleSmall,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class PremScreen extends StatelessWidget {
  const PremScreen({
    super.key,
    required this.s,
  });
  final String s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(s),
          ),
        ),
      ),
    );
  }
}
