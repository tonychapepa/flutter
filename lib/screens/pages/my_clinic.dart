import 'package:flutter/material.dart';

class MyClinic extends StatefulWidget {
  const MyClinic({super.key});

  @override
  State<MyClinic> createState() => _MyClinicState();
}

class _MyClinicState extends State<MyClinic> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Suas clinicas aqui"),
    );
  }
}
