import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class CartItemCard extends StatelessWidget {
  final Map product;

  const CartItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Image.network(
          product["image"],
          width: 50,
          height: 50,
          errorBuilder: (context, _, __) =>
              const Icon(Icons.broken_image, size: 40),
        ),
        title: Text(
          product["title"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text("\$${product["price"]}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            final providerObject = Provider.of<ProductProvider>(
              context,
              listen: false,
            );
            providerObject.removeFromCart(product);
          },
        ),
      ),
    );
  }
}
