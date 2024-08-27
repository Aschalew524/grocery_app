import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../common/productcardd.dart';

class Homepagee extends StatefulWidget {
  
  const Homepagee({super.key});
  @override
  State<Homepagee> createState() => _HomePageState();
}

  class  _HomePageState extends State<Homepagee> {
  @override
  void initState() {

    // Fetch products when the page is initialized
   // final productBloc = BlocProvider.of<ProductBloc>(context);
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
            backgroundImage: NetworkImage('assets/profile.png '),
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
              child: GridView.builder(
                itemCount: 8, 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return const ProductCard(
                    productImage: 'assets/shoes.png ',
                    productName: 'wow burger',
                    productPrice: '£ 10.00',
                    productOldPrice: '£ 12.00',
                    productRating: '4.9',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
