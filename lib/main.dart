import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikigai/screens/Home%20Screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'controllers/matrix_controller.dart';
// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
MatrixController matrixController = Get.put(MatrixController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}