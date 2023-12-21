import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/flutter-formation-c0c0c.appspot.com/o/chaise.png?alt=media&token=069faafd-3987-4f1e-8edf-af36c9ede370'));
  }
}
