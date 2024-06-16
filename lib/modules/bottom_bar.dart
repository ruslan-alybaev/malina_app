import 'package:apply_to_work/config/app_router.dart';
import 'package:apply_to_work/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  void showCartMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromDirectional(
        textDirection: TextDirection.rtl,
        start: 0,
        top: 600,
        end: 150,
        bottom: 0,
      ),
      items: [
        PopupMenuItem(
          child: Container(
            height: 130,
            child: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      context.router.push(const FoodRoute());
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffF5F5F6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.fastfood),
                          Text(
                            'Еда',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.router.push(const GoodsRoute());
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xffF5F5F6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag),
                          Text(
                            'Товары',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        FeedRoute(),
        FavoritesRoute(),
        MenuRoute(),
        ProfileRoute(),
        CartRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(splashFactory: const NoSplashFactory()),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(0, 181, 181, 181).withOpacity(0.3),
                    offset: const Offset(0, -25),
                    blurRadius: 50,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  unselectedItemColor: Palette.grey,
                  currentIndex: tabsRouter.activeIndex,
                  selectedItemColor: Palette.pink,
                  onTap: (index) async {
                    if (index == 4) {
                      tabsRouter.setActiveIndex(index);
                      await Future.delayed(
                          Duration(milliseconds: 100)); // Ensure UI update
                      showCartMenu(context);
                    } else {
                      tabsRouter.setActiveIndex(index);
                    }
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svgs/feed.svg",
                        color: tabsRouter.activeIndex == 0
                            ? Palette.pink
                            : Palette.grey,
                      ),
                      label: 'Feed',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svgs/favorite.svg",
                        color: tabsRouter.activeIndex == 1
                            ? Palette.pink
                            : Palette.grey,
                      ),
                      label: 'Favorite',
                    ),
                    BottomNavigationBarItem(
                      icon: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 60,
                          width: 60,
                          padding: const EdgeInsets.all(14),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palette.pink,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                                "assets/images/svgs/category.svg"),
                          ),
                        ),
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svgs/profile.svg",
                        color: tabsRouter.activeIndex == 3
                            ? Palette.pink
                            : Palette.grey,
                      ),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svgs/cart.svg",
                        color: tabsRouter.activeIndex == 4
                            ? Palette.pink
                            : Palette.grey,
                      ),
                      label: 'Cart',
                    ),
                  ],
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return NoSplash(
      controller: controller,
      referenceBox: referenceBox,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    required super.controller,
    required super.referenceBox,
  }) : super(
          color: Colors.transparent,
        );

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
