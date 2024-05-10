import 'package:flutter/material.dart';

class CurrencySelectionPage extends StatefulWidget {
  @override
  _CurrencySelectionPageState createState() => _CurrencySelectionPageState();
}

class _CurrencySelectionPageState extends State<CurrencySelectionPage> {
  String _selectedCurrency = 'EGP'; // Default currency

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Currency'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your currency:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            buildCurrencyOption('EGP'),
            buildCurrencyOption('SAR'),
            buildCurrencyOption('AED'),
          ],
        ),
      ),
    );
  }

  Widget buildCurrencyOption(String currency) {
    return RadioListTile(
      title: Text(currency),
      value: currency,
      groupValue: _selectedCurrency,
      onChanged: (String? value) {
        setState(() {
          _selectedCurrency = value!;
        });
      },
    );
  }
}
