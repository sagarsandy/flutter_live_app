import 'package:flutter/material.dart';
import 'package:liveapp/models/Transaction.dart';

class OrderHistoryWidget extends StatelessWidget {
  final List<Transaction> userTransactions;
  OrderHistoryWidget(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        elevation: 10,
        child: ExpansionTile(
          title: Text(
            "Order History",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade300),
          ),
          children: <Widget>[
            Column(
              children: userTransactions
                  .map(
                    (e) => Card(
                      elevation: 10,
                      borderOnForeground: true,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              e.title,
                              style: TextStyle(fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Receipt: " + e.receipt,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    "₹" + e.price.toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Date: " + e.date,
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
