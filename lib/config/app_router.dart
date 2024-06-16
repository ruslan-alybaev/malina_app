import 'package:apply_to_work/modules/bottom_bar.dart';
import 'package:apply_to_work/modules/home_page/feature/cart/presentation/screens/cart_page.dart';
import 'package:apply_to_work/modules/home_page/feature/cart/presentation/screens/food_page.dart';
import 'package:apply_to_work/modules/home_page/feature/cart/presentation/screens/goods_page.dart';
import 'package:apply_to_work/modules/home_page/feature/favorites/presentation/screens/favorites_page.dart';
import 'package:apply_to_work/modules/home_page/feature/feed/presentation/screens/feed_page.dart';
import 'package:apply_to_work/modules/home_page/feature/menu/presentation/screens/menu_page.dart';
import 'package:apply_to_work/modules/home_page/feature/profile/presentation/screens/profile_page.dart';
import 'package:apply_to_work/modules/qr_code_scanner/qr_code_scanner.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ScannerRoute.page,
        ),
        AutoRoute(
          page: FoodRoute.page,
        ),
        AutoRoute(
          page: GoodsRoute.page,
        ),
        AutoRoute(
          page: BottomBarRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: FeedRoute.page,
            ),
            AutoRoute(
              page: FavoritesRoute.page,
            ),
            AutoRoute(
              page: MenuRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
            AutoRoute(
              page: CartRoute.page,
            ),
          ],
        )
      ];
}
