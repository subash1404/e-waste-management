import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PickUp"),
        backgroundColor: const Color.fromARGB(167, 4, 77, 6),
        // backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Product Name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _productNameController,
                focusNode: _productNameFocusNode,
                decoration: InputDecoration(
                  hintText: "Enter product name",
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
                "Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _descriptionController,
                focusNode: _descriptionFocusNode,
                decoration: InputDecoration(
                  hintText: "Enter description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.text,
                maxLines: 3,
                validator: (description) {
                  if (description == null || description.trim().isEmpty) {
                    return "The description should not be empty";
                  }
                  return null;
                },
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
