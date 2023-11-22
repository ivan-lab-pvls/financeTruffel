import 'package:as_fin/models/one_news_item.dart';
import 'package:as_fin/pages/educations_page/educations_detailed_page.dart';
import 'package:as_fin/pages/educations_page/educations_page.dart';
import 'package:as_fin/pages/pages.dart';
import 'package:as_fin/pages/questions_page/questions_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _parentNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String ina = '/ina';

  static const String atHome = '/atHome';

  static const String educations = '/educations';
  static const String education = '/education';
  static const String questions = '/questions';

  static const String income = '/income';
  static const String incomePlus = '/incomePlus';

  static const String news = '/news';
  static const String oneNew = '/newI';

  static const String set = '/set';
  static const String p = '/p';

  static GoRouter get router => GoRouter(
        navigatorKey: _parentNavigatorKey,
        initialLocation: ina,
        routes: [
          GoRoute(
            path: ina,
            pageBuilder: (context, state) => const MaterialPage(
              child: InaPage(),
            ),
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                MainPage(child: navigationShell),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: atHome,
                    path: atHome,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: AtHomePage(),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: educations,
                    path: educations,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: EducationsPage(),
                    ),
                  ),
                  GoRoute(
                    name: education,
                    path: education,
                    pageBuilder: (context, state) => MaterialPage(
                      child: EducationPage(course: state.extra as OneNew),
                    ),
                  ),
                  GoRoute(
                    name: questions,
                    path: questions,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: QuestionsPage(),
                    ),
                  )
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: income,
                    path: income,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: IncomePage(),
                    ),
                  ),
                  GoRoute(
                    name: incomePlus,
                    path: incomePlus,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: IncomePlusPage(),
                    ),
                  )
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: news,
                    path: news,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: NewsPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            parentNavigatorKey: _parentNavigatorKey,
            name: oneNew,
            path: oneNew,
            pageBuilder: (context, state) => MaterialPage(
              child: OneNewPage(
                newsItem: state.extra as OneNew,
              ),
            ),
          ),
          GoRoute(
            parentNavigatorKey: _parentNavigatorKey,
            name: set,
            path: set,
            pageBuilder: (context, state) => const MaterialPage(
              child: SetsPage(),
            ),
          ),
          GoRoute(
            parentNavigatorKey: _parentNavigatorKey,
            name: p,
            path: p,
            pageBuilder: (context, state) => MaterialPage(
              child: PScreen(
                s: state.extra as String,
              ),
            ),
          ),
        ],
      );
}
