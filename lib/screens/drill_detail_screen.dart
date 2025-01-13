import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class DrillDetailScreen extends StatefulWidget {
  @override
  _DrillDetailScreenState createState() => _DrillDetailScreenState();
}

class _DrillDetailScreenState extends State<DrillDetailScreen> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final drill = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(drill['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                drill['picture_url'],
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              drill['name'],
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Total Count: ${drill['total_count']}',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            TextField(
              controller: countController,
              decoration: InputDecoration(
                labelText: 'Enter count (max: ${drill['total_count']})',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final count = int.tryParse(countController.text) ?? 0;
                if (count > 0 && count <= drill['total_count']) {
                  await firestoreService.recordDrill(
                    drillId: drill['id'],
                    drillName: drill['name'],
                    count: count,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Drill count saved successfully!')),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Enter a valid count!')),
                  );
                }
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
