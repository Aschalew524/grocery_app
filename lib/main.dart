import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as di;
import 'product/presentation/bloc/product_bloc.dart';
import 'product/presentation/pages/detail/detail_page.dart';
import 'product/presentation/pages/home/homepagee.dart'; 



void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); 
  runApp(
    
    
    const MyApp(
     
    ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<ProductBloc>(), 
        ) ,  
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const Homepagee(),
          '/detail': (context) => DetailPage(),          
        },
        title: 'Product',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
} 
























/*  import 'package:flutter/material.dart';


import 'product/presentation/pages/detail/detail_page.dart';
//import 'product/presentation/pages/home/homepagee.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:DetailPage(),
    );
  }
}
   */










