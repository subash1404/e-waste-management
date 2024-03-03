import 'package:e_waste/widgets/info_item.dart';
import 'package:flutter/material.dart';

class InfoItemList extends StatefulWidget {
  const InfoItemList({Key? key, required this.items}) : super(key: key);

  final List<Map<String, String>> items;

  @override
  _InfoItemListState createState() => _InfoItemListState();
}

class _InfoItemListState extends State<InfoItemList> {
  late List<Map<String, String>> filteredItems;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(widget.items);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = widget.items
          .where((item) => item['title']!.toLowerCase().contains(searchTerm))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Text("Recyclable items"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search by title...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(137, 26, 26, 26),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Placeholder())),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  padding: EdgeInsets.all(16),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: InfoItem(
                        image: filteredItems[index]['image'] ?? '',
                        title: filteredItems[index]['title'] ?? '',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
