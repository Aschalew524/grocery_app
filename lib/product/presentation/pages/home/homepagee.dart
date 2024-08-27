import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../bloc/product_state.dart';
import '../common/productcardd.dart';

class Homepagee extends StatefulWidget {
  const Homepagee({super.key});

  @override
  State<Homepagee> createState() => _HomePageState();
}

class _HomePageState extends State<Homepagee> {
  @override
  void initState() {
    // Fetch products when the page is initialized
    context.read<ProductBloc>().add(GetAllProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'), // Corrected to AssetImage
          ),
        ),
        title: const Row(
          children: [
            Icon(Icons.fastfood_outlined, color: Colors.orange),
            SizedBox(width: 5),
            Text(
              "Burger",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is GetAllProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetAllProductsError) {
                    return Center(child: Text(state.message));
                  } else if (state is GetAllProductsSuccess) {
                    final products = state.products;
                    
                    return GridView.builder(
                      itemCount: products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                          productImage: product.imageUrl, // Assuming imageUrl is the correct field
                          productName: product.title,
                          productPrice: '£${product.price}',
                          productOldPrice: '£${product.discount}', // Assuming discount represents old price
                          productRating: product.rating.toString(),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No products found.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
