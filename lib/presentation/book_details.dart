import 'package:flutter/material.dart';
import 'package:sitechtask/repository/remote/service_api.dart';
class BookDetails extends StatefulWidget {
  final String id;
  const BookDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  ServiceApi instance = ServiceApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Description"),
      ),
      body: FutureBuilder(
        future: instance.getSingleBook(this.widget.id),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.data == null) {
            return const Center(
              child: Text("No Description..."),
            );
          }
          else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 150,
                color: Colors.grey[300],
                padding: EdgeInsets.all(20.0),
                child: Center(
                    child: Text(snapshot.data.toString())),
              ),
            );
          }
        },

      )
    );
  }
}
