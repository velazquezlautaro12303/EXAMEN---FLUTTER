import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/Model/Screen/detail.dart';
import 'package:flutter_application_3/Model/Screen/home.dart';
import 'package:flutter_application_3/Model/Screen/login.dart';
import 'package:flutter_application_3/Model/Screen/market.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => Login(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Home(
        userId: FirebaseAuth.instance.currentUser!.uid,
      ),
    ),
    GoRoute(
      path: '/detail/:foodId',
      builder: (context, state) => Detail(
        foodId: state.pathParameters['foodId']!,
      ),
    ),
    GoRoute(
      path: '/market',
      builder: (context, state) => Market(),
    ),
  ],
);
