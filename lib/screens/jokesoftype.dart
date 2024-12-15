import 'dart:convert';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class JokesOfType extends StatefulWidget {
  const JokesOfType({super.key});

  @override
  State<JokesOfType> createState() => _JokesOfTypeState();
}

class _JokesOfTypeState extends State<JokesOfType> {
  List<Map<String, dynamic>> jokes = [];
  late String jokeType;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    jokeType = ModalRoute.of(context)?.settings.arguments as String;
    getJokesOfType();
  }

  void getJokesOfType() async {
    ApiService.getJokesByType(jokeType).then((response) {
      setState(() {
        jokes = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(jokeType.toUpperCase()),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF3E5F5),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.purpleAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jokes[index]['setup'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        jokes[index]['punchline'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
