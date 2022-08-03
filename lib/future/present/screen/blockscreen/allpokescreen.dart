import 'package:fecth2/core/config/flafovconfig.dart';
import 'package:fecth2/future/data/model/allpoke.dart';
// import 'package:fecth2/future/domain/repo/pokeallrepo.dart';
import 'package:fecth2/future/home/domain/repo/pokeallrepo.dart';
import 'package:fecth2/future/present/bloc/allpoke/pokeall_bloc.dart';
import 'package:fecth2/future/present/bloc/allpoke/pokeall_event.dart';
import 'package:fecth2/future/present/bloc/allpoke/pokeall_state.dart';
import 'package:fecth2/future/present/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fecth2/core/config/Constants.whereAmI.dart';

class Allpokescreen extends StatefulWidget {
  const Allpokescreen({Key key}) : super(key: key);

  @override
  State<Allpokescreen> createState() => _AllpokescreenState();
}

class _AllpokescreenState extends State<Allpokescreen> {
  var flavour = Constants.whereAmI;
  PokeallBloc pokeallBloc = PokeallBloc(pokeallRevo: PokeallRevo());
  bool noConnection = false,
      isLoading = false,
      hasReachedMax = false,
      isfirsload = false;
  Allpoke allpoke = Allpoke();
  ScrollController _scrollController = new ScrollController();
  List<Result> dataresult = [];
  List<Result> datafilter = [];
  String whatiwant;
  List value = [];
  List myProducts = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "q",
    "r",
    "s",
    "t",
    "u",
    "p",
    "w",
    "x",
    "z"
  ];
  @override
  void dispose() {
    pokeallBloc.close();

    super.dispose();
  }

  var limit = 0;
  var offset = 10;

  @override
  void initState() {
    super.initState();
    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          limit += 10;
          offset += 10;
        });
        _getData();
      }
    });
  }

  // ignore: missing_return
  Future<void> _getData() {
    if (isfirsload == true) {
      pokeallBloc.add(Getloadmore(offset, limit));
    } else {
      pokeallBloc.add(GetallPoke(offset, limit));
    }
  }

  // ignore: missing_return
  Future<void> _getDatafilter() {
    datafilter.clear();
    pokeallBloc.add(GetafilterPoke(0, 1154));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: Text(flavour.getFlavourName()),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, "/home-route"),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              })
        ],
      ),
      body: BlocListener<PokeallBloc, PokeallState>(
        cubit: pokeallBloc,
        listener: (_, PokeallState state) {
          if (state is PokeallLoading) {
            setState(() {
              noConnection = false;
            });
          }
          if (state is PokeallfilterLoaded) {
            for (int i = 0; i < state.pokallemodel.result.length; i++) {
              // final String name = state.pokallemodel.result[i].name;
              final name = state.pokallemodel.result[i];
              if (name.name
                  .toLowerCase()
                  .contains(value.join().toLowerCase())) {
                setState(() {
                  datafilter.add(name);
                  // nameresult.add(name);
                });
              }
            }

            // state.pokallemodel.result.forEach((v) {
            //   final String name = v.name;
            //   if (name == whatiwant) {z

            //     setState(() {
            //       datafilter.add(v);
            //     });
            //   }
            // });
          }
          if (state is PokeallLoaded) {
            if (dataresult.length <= 0) {
              setState(() {
                isfirsload = true;
              });
            }

            setState(() {
              dataresult.addAll(state.pokallemodel.result);
            });
          }
          if (state is PokeallError) {
            setState(() {
              noConnection = true;
            });
          }
        },
        child: Column(
          children: [
            choicefilter(),
            BlocBuilder<PokeallBloc, PokeallState>(
              cubit: pokeallBloc,
              // ignore: missing_return
              builder: (_, PokeallState state) {
                if (state is PokeallLoading) {
                  return loading(context);
                }
                if (state is PokeallLoaded) {
                  return lisdata(context);
                }
                if (state is PokeallfilterLoaded) {
                  return listfilter(context);
                }
                if (state is Getloadmore) {
                  return lisdata(context);
                }
                if (state is PokeallError) {
                  return Text("err");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget loading(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }

  Widget lisdata(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.indigoAccent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: dataresult.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 100,
              child: ListTile(
                leading: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbJC_12Qa1pACdjOsAujNhaEhEzz6RnsQf3Q&usqp=CAU"),
                // title: Text(pokeallBloc.allpoke.result[index].name),
                title: Text("${dataresult[index].name}"),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget listfilter(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.indigoAccent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      child: ListView.builder(
        itemCount: datafilter.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 100,
              child: ListTile(
                leading: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbJC_12Qa1pACdjOsAujNhaEhEzz6RnsQf3Q&usqp=CAU"),
                // title: Text(pokeallBloc.allpoke.result[index].name),
                title: Text("${datafilter[index].name}"),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget choicefilter() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: value.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Text(value[index]);
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            padding: EdgeInsets.all(5),
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 60,
                    childAspectRatio: 5 / 9,
                    mainAxisExtent: 100,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20),
                itemCount: myProducts.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Material(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.amber,
                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        setState(() {
                          whatiwant = myProducts[index];
                          value.add(myProducts[index]);
                        });
                        _getDatafilter();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(myProducts[index]),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
