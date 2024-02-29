import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

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
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  final List<String> predefinedItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    // Add more items as needed
  ];

  List<String> selectedItems = [];
  bool selectingItems = true;

  @override
  void dispose() {
    _productNameFocusNode.dispose();
    _weightFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _locationFocusNode.dispose();
    _productNameController.dispose();
    _weightController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _showMultiSelect() async {
    final List<String> results = await showDialog(
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
                              : selectedItems.join(", "),
                          style: TextStyle(
                            color: selectingItems ? Colors.grey : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    if (selectingItems)
                      IconButton(
                        onPressed: _showMultiSelect,
                        icon: Icon(Icons.arrow_drop_down),
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
                onPressed: () {
                  // Submit action
                },
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
  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
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
      title: const Text('Select Items'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map(
                (item) => CheckboxListTile(
                  value: _selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => _itemChange(item, isChecked!),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
