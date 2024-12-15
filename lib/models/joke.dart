class Joke {
  final String type;
  final String setup;
  final String punchline;

  Joke({required this.type, required this.setup, required this.punchline});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      setup: json['setup'],
      punchline: json['punchline'],
      type: json['type']
    );
  }
}