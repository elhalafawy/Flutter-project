import 'package:flutter/material.dart';

class CountrySelectionPage extends StatefulWidget {
  @override
  _CountrySelectionPageState createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  String _selectedCountry = 'Egypt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Country'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your country:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            buildCountryOption('Saudi Arabia'),
            buildCountryOption('UAE'),
            buildCountryOption('Egypt'),
          ],
        ),
      ),
    );
  }

  Widget buildCountryOption(String countryName) {
    return RadioListTile(
      title: Text(countryName),
      value: countryName,
      groupValue: _selectedCountry,
      onChanged: (String? value) {
        setState(() {
          _selectedCountry = value!;
        });
      },
    );
  }
}
