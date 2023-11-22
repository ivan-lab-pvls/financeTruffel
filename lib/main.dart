import 'dart:async';
import 'package:as_fin/app_theme.dart';
import 'package:as_fin/configure.dart';
import 'package:as_fin/notifx.dart';
import 'package:as_fin/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 5),
    minimumFetchInterval: const Duration(seconds: 5),
  ));

  await FirebaseRemoteConfig.instance.fetchAndActivate();

  await NotificationServiceFb().init();
  final bd = await SharedPreferences.getInstance();

  final StreamController<bool> updateBalanceStream =
      StreamController<bool>.broadcast();

  runApp(MyApp(bd, updateBalanceStream));
}

class MyApp extends StatefulWidget {
  const MyApp(this._bd, this._stream, {super.key});

  final SharedPreferences _bd;
  final StreamController<bool> _stream;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    widget._stream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: widget._stream,
      child: Provider.value(
        value: widget._bd,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'App',
          routerConfig: Routes.router,
          theme: CustomTheme.darkTheme,
        ),
      ),
    );
  }
}
