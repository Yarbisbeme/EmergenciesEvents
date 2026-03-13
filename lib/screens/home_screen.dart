
import 'dart:io';

import 'package:emergenciesevents/database/database_helper.dart';
import 'package:emergenciesevents/model/emergency_event.dart';
import 'package:emergenciesevents/screens/add_event_screen.dart';
import 'package:emergenciesevents/screens/event_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<EmergencyEvent> _events = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _refreshEvents();
  }

  Future<void> _refreshEvents() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final events = await DatabaseHelper.instance.getAll();
      setState(() {
        _events = events;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Ha ocurrido un error al traer los eventos')));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergencies 911'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => AddEventScreen(),));
          if (result == true) {
            _refreshEvents();
          }
        }, 
        icon: Icon(Icons.add_alert),
        label: const Text('Add Event')),

      body: _isLoading
      ? Center(child: const CircularProgressIndicator(),)
      : _events.isEmpty
        ? Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shield_outlined, size: 80, color: Colors.grey.shade400,),
            SizedBox(height: 16,),
            Text('No Emergencies', style: TextStyle(color: Colors.grey.shade600, fontSize: 18),)
          ],
        ),
        )
        :ListView.builder(
          padding: const EdgeInsets.only(bottom: 80, top: 12),
          itemCount: _events.length,
          itemBuilder: (context, index) {
            final event = _events[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 2,
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(event.imagePath),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  event.title
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('${event.date}', style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w500),
                  )
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16,),
                onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailScreen(event: event),
                            ),
                          );
                        },
              ),
            );
          })
    );
  }
}
