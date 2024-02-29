import 'package:flutter/material.dart';

class Request extends StatelessWidget {
  const Request({
    required this.orderId,
    required this.title,
    required this.weight,
    required this.status,
    Key? key,
  }) : super(key: key);

  final String title;
  final int orderId;
  final int weight;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: Container(
            width: MediaQuery.of(context).size.width - 16,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
              child: Row(
                children: [
                  // SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          overflow:
                              TextOverflow.ellipsis, // Allow text overflow
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          weight.toString() + " Kg",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Status: " + status,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: status == "open" ? 40 : 32,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: status == "closed"
                                  ? Colors.green
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 12),
                            child: Text(
                              "ID: " + orderId.toString(),
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/gmaps.png',
                              height: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE0F0DE),
                                side: BorderSide(color: Colors.green, width: 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12)),
                            label: const Text(
                              "Maps",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 0.5,
          color: const Color.fromARGB(255, 64, 64, 64),
        )
      ],
    );
  }
}
