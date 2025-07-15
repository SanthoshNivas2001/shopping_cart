import 'package:ecommerce_app/view/screens/cart_details_screen.dart';
import 'package:ecommerce_app/view/screens/home_screen.dart';
import 'package:ecommerce_app/view/screens/shopping_cart_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;
        return CartDetailsScreen(name: data['name']!, image: data['image']! , price: data['price']!,);
      },
    ),
  ],
);
