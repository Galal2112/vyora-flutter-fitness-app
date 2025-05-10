import 'package:flutter/material.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 18;
  String _gender = 'Male';
  double _height = 170;
  double _weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tell us about you')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => _name = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _age = int.tryParse(value ?? '18') ?? 18,
              ),
              DropdownButtonFormField<String>(
                value: _gender,
                items: ['Male', 'Female', 'Other'].map((gender) {
                  return DropdownMenuItem(value: gender, child: Text(gender));
                }).toList(),
                onChanged: (value) => setState(() => _gender = value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Height (cm)'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _height = double.tryParse(value ?? '170') ?? 170,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _weight = double.tryParse(value ?? '70') ?? 70,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text('Next'),
                onPressed: () {
                  _formKey.currentState?.save();
                  // TODO: Save to provider/state and navigate
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
