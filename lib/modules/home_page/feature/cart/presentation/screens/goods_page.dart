import 'package:apply_to_work/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GoodsPage extends StatefulWidget {
  const GoodsPage({super.key});

  @override
  _GoodsPageState createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  // Map to store item quantities
  final Map<String, int> _itemQuantities = {
    'hadatShampoo': 1,
    'hadatConditioner': 1,
    'lOrealShampoo': 1,
  };

  void _incrementQuantity(String itemKey) {
    setState(() {
      _itemQuantities[itemKey] = _itemQuantities[itemKey]! + 1;
    });
  }

  void _decrementQuantity(String itemKey) {
    setState(() {
      if (_itemQuantities[itemKey]! > 1) {
        _itemQuantities[itemKey] = _itemQuantities[itemKey]! - 1;
      }
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
        child: ListView(
          children: [
            _buildItemCard(
              context,
              'hadatShampoo',
              'Hadat Cosmetics',
              'Шампунь интенсивно\nвосстанавливающий Hydro\nIntensive Repair Shampoo 250 мл',
              'assets/images/pngs/hadatShampoo.png',
              1900,
            ),
            const SizedBox(height: 20),
            _buildItemCard(
              context,
              'hadatConditioner',
              'Hadat Cosmetics',
              'Увлажняющий кондиционер\n150 мл',
              'assets/images/pngs/hadatConditioner.png',
              2000,
            ),
            const SizedBox(height: 20),
            _buildItemCard(
              context,
              'lOrealShampoo',
              "L'Oreal Paris\nElseve",
              'Шампунь для\nослабленных волосл',
              'assets/images/pngs/lOrealShampoo.png',
              600,
            ),
            const SizedBox(height: 20),
            Container(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Palette.pink,
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
                      '3900 c',
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
    );
  }

  Widget _buildItemCard(
    BuildContext context,
    String itemKey,
    String title,
    String description,
    String imagePath,
    int price,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                print("tapped");
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 110,
                    width: 110,
                    child: Card(
                      child: Image.asset(imagePath),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '$price c',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          description,
                          style: const TextStyle(
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
                                    _decrementQuantity(itemKey);
                                  },
                                  icon: const Card(child: Icon(Icons.remove)),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${_itemQuantities[itemKey]}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {
                                    _incrementQuantity(itemKey);
                                  },
                                  icon: const Card(child: Icon(Icons.add)),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                // Handle delete item
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
