import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 1 - Andrej Genchovski, index: 211229',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clothingItems = [
      {
        'name': 'Lacoste Men\'s Short Sleeve Classic Pique Polo Shirt',
        'image': 'https://m.media-amazon.com/images/I/61m62OzjWEL._AC_SX466_.jpg',
        'price': '\$16.99',
        'description': 'This regular-fit shirt is made of 70% cotton, 27% polyester, and 3% spandex. It features a stain shield and waterproof technology to keep you looking pristine all day without worrying about spills.',
      },
      {
        'name': 'Champion Men\'s T-Shirt, Classic Graphic',
        'image': 'https://m.media-amazon.com/images/I/515FsvUTrAL._AC_SX569_.jpg',
        'price': '\$9.19',
        'description': 'A comfortable, 100% cotton t-shirt with a classic script logo on the chest and an iconic C logo patch on the sleeve. This shirt is easy to care for and made to last.',
      },
      {
        'name': 'Men\'s Casual Knit Polo Sweater',
        'image': 'https://m.media-amazon.com/images/I/71R--H7Gu0L._AC_SX679_.jpg',
        'price': '\$29.99',
        'description': 'This long-sleeve knit polo sweater is made of soft, premium fabric that is stretchy and comfortable. It features a zipper design, ribbed cuffs, and a versatile look that pairs well with both casual and formal wear.',
      },
      {
        'name': 'Levi\'s Men\'s 559 Relaxed Straight Jeans',
        'image': 'https://m.media-amazon.com/images/I/61XMXmo-0iL._AC_SY550_.jpg',
        'price': '\$29.59',
        'description': 'These relaxed-fit jeans sit below the waist and offer extra room through the seat and thigh. Made from 98% cotton and 2% elastane, they provide comfort and flexibility.',
      },
      {
        'name': 'Lee Men\'s Big and Tall Extreme Motion Relaxed Straight Jean',
        'image': 'https://m.media-amazon.com/images/I/71ywHpokfVL._AC_SY550_.jpg',
        'price': '\$34.99',
        'description': 'This relaxed-fit, straight-leg jean features an athletically-inspired elastic waistband and extreme-stretch denim for added comfort and flexibility. Available in various sizes.',
      },
      {
        'name': 'Lee Men\'s Extreme Motion Straight Taper Jean',
        'image': 'https://m.media-amazon.com/images/I/61PlX2fgIXL._AC_SY550_.jpg',
        'price': '\$33.28',
        'description': 'These jeans offer a straight fit through the hip and thigh with a comfortable extreme flex waistband. They come in a midweight denim and feature classic five-pocket styling.',
      },
      {
        'name': 'TACVASEN Men\'s Bomber Jacket Lightweight Casual Spring Fall Windbreaker',
        'image': 'https://m.media-amazon.com/images/I/71E7c09iTdL._AC_SX522_.jpg',
        'price': '\$31.98',
        'description': 'This polyester bomber jacket is lightweight and features rib knit cuffs, a waistband, and a collar for added comfort. It includes multiple pockets for convenience and is perfect for outdoor activities.',
      },
      {
        'name': 'Men\'s Bomber Jacket Fashion Stylish Lightweight Windbreaker',
        'image': 'https://m.media-amazon.com/images/I/71gvJnWVtyL._AC_SX569_.jpg',
        'price': '\$33.99',
        'description': 'A stylish, lightweight bomber jacket made from polyester. This jacket features a ribbed collar, cuffs, and hem, and is suitable for various occasions including daily wear and street fashion.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('211229'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    item['image']!,
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      item['name']!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      item['price']!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, String> item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']!),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item['image']!, height: 300),
            const SizedBox(height: 16),
            Text(
              item['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: ${item['price']}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              item['description']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

