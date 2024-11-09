import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app_admin/presentation/landing_page/screens/landing_screen.dart';
import 'package:music_app_admin/provider/landing_page_provider.dart';
import 'package:music_app_admin/provider/playlist_page_provider.dart';
import 'package:music_app_admin/provider/songslist_page_provider.dart';
import 'package:provider/provider.dart';

import 'provider/users_page_provider.dart';
import 'utils/app_pallate.dart';

void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LandingPageProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => UsersPageProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => PlaylistPageProvider(),
    ),
     ChangeNotifierProvider(
      create: (context) => SongslistPageProvider(),
    ),
  ], child: const MyApp()));
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LandingScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'landingScreen',
          builder: (BuildContext context, GoRouterState state) {
            return const LandingScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppPallate.whiteColor),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppPallate.whiteColor),
              ))),
      routerConfig: _router,
    );
  }
}
