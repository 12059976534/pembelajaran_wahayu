import 'package:fecth2/future/present/provider/getlistpoke.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Scrennpilih extends StatefulWidget {
  const Scrennpilih({Key key}) : super(key: key);

  @override
  State<Scrennpilih> createState() => _ScrennpilihState();
}

class _ScrennpilihState extends State<Scrennpilih> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // getlistpoke.getpoke();
  }

  List data = [];
  _getlist(List resource) {
    resource.forEach((x) {
      if (x["ischeck"] == true) {
        setState(() {
          data.add(x);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<GetlistDatapoke>(context);
    _getlist(postMdl.check);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("sequa kah ??!!"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: (postMdl.result.isEmpty)
            ? Center(
                child: Text("Anda belum memilih coy !!"),
              )
            : ListView.builder(
                itemCount: postMdl.result.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          postMdl.minusresoult(postMdl.result[index]);
                        }),
                    leading: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbJC_12Qa1pACdjOsAujNhaEhEzz6RnsQf3Q&usqp=CAU"),
                    title: Text(postMdl.result[index].name),
                  );
                },
              ),
      ),
    );
  }
}
