import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_app/model/team.dart';
import 'package:nba_app/pages/team_details_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Team> teams = [];

  Future<void> getTeams() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.balldontlie.io/v1/teams'),
        headers: {
          'Authorization':
              'c99a0326-5d69-45b6-9955-554958f196ce', // Adjust if needed
        },
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        try {
          var jsonData = jsonDecode(response.body);

          teams.clear();
          for (var eachTeam in jsonData['data']) {
            final team = Team(
              abbreviation: eachTeam['abbreviation'],
              city: eachTeam['city'],
              fullName: eachTeam['full_name'],
              conference: eachTeam['conference'],
              division: eachTeam['division'],
            );

            teams.add(team);
          }

          print('Number of teams: ${teams.length}');
        } catch (e) {
          print('Error decoding JSON: $e');
        }
      } else {
        print('Failed to load teams. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => getTeams());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'NBA Teams',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 5,
      ),
      body: FutureBuilder(
        future: getTeams(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return ListView.builder(
              itemCount: teams.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orangeAccent,
                          blurRadius: 7,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: Icon(
                        Icons.sports_basketball,
                        color: Colors.orange,
                      ),
                      title: Text(
                        teams[index].abbreviation,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        teams[index].city,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamDetailsScreen(
                              fullName: teams[index].fullName,
                              abbreviation: teams[index].abbreviation,
                              city: teams[index].city,
                              conference: teams[index].conference,
                              division: teams[index].division,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
