import 'package:flutter/material.dart';

class TeamDetailsScreen extends StatelessWidget {
  final String fullName;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;

  TeamDetailsScreen({
    required this.fullName,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(fullName),
        backgroundColor: Colors.redAccent,
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Team Logo
            Center(
              child: Icon(
                Icons.sports_basketball,
                size: 120,
                color: Colors.orangeAccent,
              ),
            ),
            SizedBox(height: 16),
            // Team Details
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Abbreviation',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      abbreviation,
                      style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'City',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      city,
                      style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Conference',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      conference,
                      style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Division',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      division,
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 16),
                    // Add additional widgets or details here if needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
