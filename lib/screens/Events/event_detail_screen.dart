import 'package:flutter/material.dart';
import 'package:ikigai/models/event_model.dart';

class EventDetailsScreen extends StatelessWidget {
   EventDetailsScreen({Key? key, EventModel? event}) : super(key: key);
    // event avi gya che barober
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Center(
        child: Text('Event Details'),
      ),
    );
  }
}
