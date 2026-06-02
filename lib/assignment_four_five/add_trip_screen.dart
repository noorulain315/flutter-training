import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_training/assignment_one/trip_repository.dart';
import 'package:go_router/go_router.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;
  TripStatus _tripStatus = TripStatus.planning;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your Trip"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Trip Name'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a name'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description (optional)',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  _startDate == null
                      ? 'Select Start Date'
                      : 'Start: ${_startDate.toString().split(' ')[0]}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => {_pickDate(isStart: true)},
              ),
              ListTile(
                title: Text(
                  _endDate == null
                      ? 'Select End Date'
                      : 'End: ${_endDate.toString().split(' ')[0]}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => {_pickDate(isStart: false)},
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<TripStatus>(
                initialValue: _tripStatus,
                decoration: const InputDecoration(labelText: 'Status'),
                items: TripStatus.values
                    .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
                    .toList(),
                onChanged: (value) =>
                    setState(() => _tripStatus = value ?? TripStatus.planning),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _onSubmit();
                },
                child: const Text("Add Trip"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      final Trip trip = Trip(
        Random().nextInt(100),
        _nameController.text,
        _startDate ?? DateTime.now(),
        _endDate ?? DateTime.now(),
        _descriptionController.text,
        _tripStatus,
      );
      context.pop(trip);
    }
  }

  Future _pickDate({required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {}
    setState(() {
      if (isStart) {
        _startDate = picked;
      } else {
        _endDate = picked;
      }
    });
  }
}
