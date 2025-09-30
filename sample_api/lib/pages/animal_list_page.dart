import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import '../model/animal_response.dart';
import '../utils/logging_interceptor.dart';

class AnimalListPage extends StatefulWidget {
  const AnimalListPage({super.key});

  @override
  State<AnimalListPage> createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {
  List<Animal> animals = [];
  bool isLoading = false;
  String errorMessage = '';

  final http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  Future<void> fetchAnimals() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final response = await client.get(Uri.parse(('https://dog.ceo/api/breeds/image/random/10')));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final animalResponse = AnimalResponse.fromJson(data);
        setState(() {
          animals = animalResponse.animals;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load animal images');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load animal Images $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAnimals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal API Example'),
      ),
      body: isLoading
      ? const Center(child: CircularProgressIndicator())
      : errorMessage.isNotEmpty 
        ? Center(child: Text(errorMessage)) 
        : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 10, 
            mainAxisSpacing: 10
          ), 
          itemCount: animals.length,
          itemBuilder: (context, index) {
            final animal = animals[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Image.network(animal.imageUrl, fit: BoxFit.cover,)
            );
          })
    );
  }
}
