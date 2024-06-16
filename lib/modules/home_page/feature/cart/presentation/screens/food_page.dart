import 'package:apply_to_work/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  bool isDeliverySelected = true;

  void _toggleSelection(bool isDelivery) {
    setState(() {
      isDeliverySelected = isDelivery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text(
          "Корзина",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Очистить",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 167,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      _toggleSelection(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isDeliverySelected ? Palette.pink : Colors.white,
                    ),
                    child: Text(
                      "Доставка",
                      style: TextStyle(
                        color: isDeliverySelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 167,
                  child: ElevatedButton(
                    onPressed: () {
                      _toggleSelection(false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isDeliverySelected ? Colors.white : Palette.pink,
                    ),
                    child: Text(
                      "В заведении",
                      style: TextStyle(
                        color: isDeliverySelected ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Conditional information display
            if (isDeliverySelected)
              DeliveryInfoWidget()
            else
              InRestaurantInfoWidget(),
          ],
        ),
      ),
    );
  }
}

class DeliveryInfoWidget extends StatefulWidget {
  const DeliveryInfoWidget({super.key});

  @override
  State<DeliveryInfoWidget> createState() => _DeliveryInfoWidgetState();
}

class _DeliveryInfoWidgetState extends State<DeliveryInfoWidget> {
  int itemCount = 1;

  void _incrementCount() {
    setState(() {
      itemCount++;
    });
  }

  void _decrementCount() {
    if (itemCount > 1) {
      setState(() {
        itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: const Row(
                    children: [
                      Text(
                        'Bellagio Coffee',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    SizedBox(
                      height: 110,
                      width: 110,
                      child: Card(
                        child: Image.asset('assets/images/pngs/pizza.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Том ям',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                '250 c',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Пицца с соусами том ям\n230 гр',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _decrementCount();
                                    },
                                    icon: const Card(
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    "$itemCount",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  IconButton(
                                    onPressed: () {
                                      _incrementCount();
                                    },
                                    icon: const Card(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xfff8f8f8)),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Добавки',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Заказать',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '250 c',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
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
      ],
    );
  }
}

class InRestaurantInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'In-Restaurant Information:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // Add more in-restaurant specific information here
      ],
    );
  }
}
