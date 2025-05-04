import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firestore',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirestoreScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Firestore',
      home: FirestoreScreen(),
    );
  }
}
*/
class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({super.key});

  @override
  _FirestoreScreenState createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {
  // Función para agregar un usuario a Firestore
  Future<void> addUser() async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection(
        'users',
      );

      await users.add({
        'name': 'John Doe',
        'email': 'johndoe@example.com',
        'age': 30,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print("✅ Usuario agregado correctamente");
    } catch (e) {
      print("❌ Error al agregar usuario: $e");
    }
  }

  // Función para comprobar la conexión con Firestore
  Future<void> checkFirestore() async {
    try {
      await FirebaseFirestore.instance.collection('test').doc('check').set({
        'status': 'connected',
        'timestamp': FieldValue.serverTimestamp(),
      });

      print("✅ Firestore está funcionando correctamente!");
    } catch (e) {
      print("❌ Error al conectar con Firestore: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text('Prueba Firebase Firestore'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addUser,
              child: const Text('Agregar Usuario'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: checkFirestore,
              child: const Text('Comprobar Firestore'),
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Go To Login'),
            ),
          ],
        ),
      ),
    );
  }
}
