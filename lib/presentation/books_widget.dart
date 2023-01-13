import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sitechtask/presentation/book_details.dart';
import 'package:sitechtask/repository/remote/service_api.dart';
class BooksWidget extends StatefulWidget {
  const BooksWidget({Key? key}) : super(key: key);
  @override
  State<BooksWidget> createState() => _BooksWidgetState();
}

class _BooksWidgetState extends State<BooksWidget> {
  ServiceApi instance = ServiceApi();
  void initState(){
    super.initState();
    instance.getBooks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SiTechTask"),
        ),
        body: FutureBuilder(
          future: instance.getBooks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: Text("Loading..."),
              );
            }
            else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final String id = snapshot.data[index].id;
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                      NetworkImage(snapshot.data[index].cover),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].author),
                    onLongPress: () {
                      print("on long pressed");
                    },
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> BookDetails(id: id,)));
                    },
                    trailing: IconButton(onPressed: (){
                      instance.deleteSingleBook(id);
                      setState(() {});
                      showToast();
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => super.widget));
                    },icon: const Icon(Icons.delete,color: Colors.red,),),
                  );
                },
              );
            }
          },
        ));
  }
  void showToast() {
    Fluttertoast.showToast(
        msg: 'Book Deleted',
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        fontSize: 15.0,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}
