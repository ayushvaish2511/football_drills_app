import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class DashboardScreen extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Drills'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: firestoreService.fetchUserDrills(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final drills = snapshot.data ?? [];
          if (drills.isEmpty) {
            return Center(child: Text('No drills recorded yet.'));
          }

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: drills.length,
            itemBuilder: (context, index) {
              final drill = drills[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: ListTile(
                  leading: Image.network(drill['picture_url'], height: 50),
                  title: Text(drill['name']),
                  subtitle: Text(
                    'Your Count: ${drill['count']} / ${drill['total_count']}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
