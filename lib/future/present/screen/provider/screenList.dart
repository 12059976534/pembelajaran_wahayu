import 'package:fecth2/future/present/provider/getlistpoke.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listprvider extends StatefulWidget {
  const Listprvider({Key key}) : super(key: key);

  @override
  State<Listprvider> createState() => _ListprviderState();
}

class _ListprviderState extends State<Listprvider> {
  var check = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final getlistpoke = Provider.of<GetlistDatapoke>(context, listen: false);
    getlistpoke.getpoke();
  }

  List uri = [];
  seturi(url, name) {}
  List c = [];
  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<GetlistDatapoke>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("list pkemon with provider "),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: (postMdl.loading == true)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: postMdl.allpoke.result.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            selected: true,
                            trailing: IconButton(
                              onPressed: () {
                                postMdl
                                    .plusresoult(postMdl.allpoke.result[index]);
                              },
                              icon: Icon(Icons.exposure_plus_1),
                            ),
                            // trailing: Checkbox(
                            //     value: postMdl.check[index]["ischeck"],
                            //     onChanged: (x) {
                            //       // print(c);

                            //       if (c.length <= 4) {
                            //         if (c.any((item) => item == index)) {
                            //           setState(() {
                            //             c.remove(index);
                            //             postMdl.check[index]["ischeck"] = x;
                            //           });
                            //         } else {
                            //           setState(() {
                            //             c.add(index);
                            //             postMdl.check[index]["ischeck"] = x;
                            //           });
                            //         }
                            //       } else {
                            //         if (c.any((item) => item == index)) {
                            //           setState(() {
                            //             c.remove(index);
                            //             postMdl.check[index]["ischeck"] = x;
                            //           });
                            //         }
                            //       }
                            //     }),
                            leading: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbJC_12Qa1pACdjOsAujNhaEhEzz6RnsQf3Q&usqp=CAU"),
                            title: Text(postMdl.allpoke.result[index].name),
                          ),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, route)
                      Navigator.pushNamed(context, "/screen_dipilih");
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            postMdl.result.length.toString(),
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5, right: 10),
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 12,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.arrow_right_alt_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
