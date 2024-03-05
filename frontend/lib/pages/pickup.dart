import 'dart:convert';
import 'package:e_waste/pages/nav.dart';
import 'package:e_waste/utlis/shared_preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PickupPageState();
  }
}

class _PickupPageState extends State<PickupPage> {
  final FocusNode _productNameFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  SharedPreferences? prefs = SharedPreferencesManager.preferences;

  final List<String> predefinedItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 2',
    'Item 3',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 1',
    'Item 2',
    'Item 3',
    // Add more items as needed
  ];

  void sendReq() async {
    print(selectedItems);
    var userId = prefs?.getString('userId');
    try {
      var response = await http.post(
          Uri.parse(
              "http://${dotenv.env["BACKEND_BASE_API"]}/request/postRequest"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "title": _productNameController.text,
            "weight": _weightController.text,
            "lat": "72.12",
            "long": "72.12",
            "products": selectedItems,
            "userId": userId
          }));
      var responseData = jsonDecode(response.body);
      if (response.statusCode > 399) {
        throw "Unable to send request";
      }
      // Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavPage()));
    } catch (err) {
      print(err);
      throw "Something went wrong";
    }
  }

  List<Map<String, dynamic>> selectedItems = [];
  bool selectingItems = true;

  @override
  void dispose() {
    _productNameFocusNode.dispose();
    _weightFocusNode.dispose();
    _locationFocusNode.dispose();
    _productNameController.dispose();
    _weightController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _showMultiSelect() async {
    final List<Map<String, dynamic>> results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: predefinedItems);
      },
    );

    if (results != null) {
      setState(() {
        selectedItems = results;
        selectingItems = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PickUp"),
        backgroundColor: const Color.fromARGB(167, 4, 77, 6),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Title",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _productNameController,
                focusNode: _productNameFocusNode,
                decoration: InputDecoration(
                  hintText: "Enter Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: (productName) {
                  if (productName == null || productName.trim().isEmpty) {
                    return "The product name should not be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                "Weight",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _weightController,
                focusNode: _weightFocusNode,
                decoration: InputDecoration(
                  hintText: "Enter weight",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (weight) {
                  if (weight == null || weight.trim().isEmpty) {
                    return "The weight should not be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                "List of Products",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                height: 56,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          selectingItems
                              ? "Select Items"
                              : selectedItems
                                  .map((item) => item["product"])
                                  .join(", "),
                          style: TextStyle(
                            color: selectingItems ? Colors.grey : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    if (selectingItems)
                      IconButton(
                        onPressed: _showMultiSelect,
                        icon: const Icon(
                          Icons.add,
                          size: 25,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _locationController,
                focusNode: _locationFocusNode,
                decoration: InputDecoration(
                  hintText: "Enter location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: (location) {
                  if (location == null || location.trim().isEmpty) {
                    return "The location should not be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: sendReq,
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color.fromARGB(167, 4, 77, 6),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  minimumSize: const Size(double.infinity, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<Map<String, dynamic>> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add({"product": itemValue});
      } else {
        _selectedItems
            .removeWhere((element) => element["product"] == itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 230, 255, 230),
      title: const Text('Select Items'),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25, // Set a fixed height
        child: SingleChildScrollView(
          // Wrap content in SingleChildScrollView
          child: ListBody(
            children: widget.items
                .map(
                  (item) => Container(
                    padding: EdgeInsets.zero,
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: _selectedItems
                          .any((element) => element["product"] == item),
                      title: Text(
                        item,
                        style: TextStyle(fontSize: 20),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (isChecked) => _itemChange(item, isChecked!),
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      tileColor: Colors.transparent,
                      dense: true,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Color.fromARGB(255, 181, 22, 22)),
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.green.shade100,
              foregroundColor: Colors.green.shade800),
          onPressed: _submit,
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
