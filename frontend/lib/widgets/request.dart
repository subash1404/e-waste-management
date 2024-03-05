import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Import QrImage package

class Request extends StatefulWidget {
  const Request({
    required this.title,
    required this.weight,
    required this.status,
    Key? key,
  }) : super(key: key);

  final String title;
  final int weight;
  final String status;

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  late String _qrData;

  @override
  void initState() {
    super.initState();
    _generateQRData();
  }

  void _generateQRData() {
    // Generate QR data with product and weight information
    _qrData = 'Product: ${widget.title}, Weight: ${widget.weight} Kg';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Container(
            width: MediaQuery.of(context).size.width - 16,
            // ignore: sort_child_properties_last
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   width: 40,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     image: DecorationImage(
                  //       image: widget.status == "closed"
                  //           ? AssetImage('assets/images/ok.png')
                  //           : AssetImage('assets/images/pending.png'),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${widget.weight} Kg',
                          style: const TextStyle(
                              color: Color.fromARGB(135, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.qr_code, size: 30),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.green.shade200,
                                child: Container(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'QR for ' + widget.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: Container(
                                          child: QrImageView(
                                            data: _qrData,
                                            version: QrVersions.auto,
                                            size: 230,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Container(
                        decoration: widget.status == "closed"
                            ? BoxDecoration(
                                color: Color.fromARGB(255, 158, 255, 138),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.green))
                            : BoxDecoration(
                                color: const Color.fromARGB(255, 255, 168, 161),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.red)),
                        height: 20,
                        width: 60,
                        child: Align(
                          alignment: Alignment.center,
                          child: widget.status == "closed"
                              ? Text(
                                  "Closed",
                                  style: TextStyle(fontSize: 12),
                                )
                              : Text(
                                  "Pending",
                                  style: TextStyle(fontSize: 12),
                                ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          height: 2,
          color: Colors.green.shade900,
        ),
      ],
    );
  }
}
