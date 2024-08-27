import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _counter = 1;
  bool _addCheese = false;
  bool _addBacon = false;
  bool _addMeat = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/burger.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.red),
              onPressed: () {},
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Chicken Detail',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        const Row(
                          children: [
                            Text(
                              '£10.00',
                              style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '£6.00',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text('4.9'),
                            SizedBox(width: 4),
                            Text('(1,205)'),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text('See all review'),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        const Text(
                          'A delicious chicken Detail served on a toasted bun with fresh lettuce, tomato slices, and mayonnaise. Juicy grilled chicken patty seasone...',
                          maxLines: 2,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('See more'),
                        ),
                        SizedBox(height: 16),
                        const Text(
                          'Additional Options:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        _buildOptionRow(
                            'Add Cheese', '+ £0.50', _addCheese, (value) {
                          setState(() {
                            _addCheese = value!;
                          });
                        }),
                        _buildOptionRow(
                            'Add Bacon', '+ £1.00', _addBacon, (value) {
                          setState(() {
                            _addBacon = value!;
                          });
                        }),
                        _buildOptionRow('Add Meat', '+ £1.5', _addMeat, (value) {
                          setState(() {
                            _addMeat = value!;
                          });
                        }),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            _buildCounter(),
                            SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: const Text('Add to Basket',style:TextStyle( fontWeight: FontWeight.bold,color: Colors.white )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(
      String option, String price, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(option),
          Row(
            children: [
              Text(price),
              Checkbox(
                value: value,
                onChanged: onChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: _decrementCounter,
          ),
          Text('$_counter'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _incrementCounter,
          ),
        ],
      ),
    );
  }
}