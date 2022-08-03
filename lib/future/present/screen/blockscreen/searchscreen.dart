import 'package:fecth2/future/data/model/allpoke.dart';
import 'package:fecth2/future/home/domain/repo/pokeallrepo.dart';
// import 'package:fecth2/future/domain/repo/pokeallrepo.dart';
import 'package:fecth2/future/present/bloc/allpoke/pokeall_state.dart';
import 'package:fecth2/future/present/bloc/search/pokeasearch_bloc.dart';
import 'package:fecth2/future/present/bloc/search/pokeasearch_event.dart';
import 'package:fecth2/future/present/bloc/search/pokeasearch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({Key key, this.query}) : super(key: key);
  final query;
  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  PokeSearchBloc pokeSearchBloc = PokeSearchBloc(pokeallRevo: PokeallRevo());
  Allpoke allpoke = Allpoke();
  bool isfirsload = false;
  List<Result> dataresult = [];
  List<String> nameresult = [];

  @override
  void dispose() {
    pokeSearchBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  // ignore: unused_element
  Future<void> _getData() {
    pokeSearchBloc.add(GetaSearcPoke(0, 1154));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<PokeSearchBloc, PokesearchState>(
      cubit: pokeSearchBloc,
      listener: (_, PokesearchState state) {
        if (state is PokesearchLoading) {
          setState(() {
            // noConnection = false;
          });
        }
        if (state is PokeserchLoaded) {
          for (int i = 0; i < state.pokallemodel.result.length; i++) {
            final String name = state.pokallemodel.result[i].name;
            if (name.toLowerCase().contains(widget.query.toLowerCase())) {
              setState(() {
                nameresult.add(name);
              });
            }
          }
        }
        if (state is PokesearchError) {
          setState(() {
            // noConnection = true;
          });
        }
      },
      child: BlocBuilder<PokeSearchBloc, PokesearchState>(
        cubit: pokeSearchBloc,
        builder: (_, PokesearchState state) {
          if (state is PokesearchLoading) {
            return loading(context);
          }
          if (state is PokeserchLoaded) {
            return lisdata(context);
          }
          if (state is PokeLoadmoreloading) {
            return lisdata(context);
          }
          if (state is PokesearchError) {
            return Text("err");
          }
        },
      ),
    ));
  }

  Widget loading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.amber,
      ),
    );
  }

  Widget lisdata(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.indigoAccent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: (nameresult.isEmpty)
          ? Center(
              child: Text("no resoult found"),
            )
          : ListView.builder(
              // controller: _scrollController,
              itemCount: nameresult.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    height: 100,
                    child: ListTile(
                      leading: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbJC_12Qa1pACdjOsAujNhaEhEzz6RnsQf3Q&usqp=CAU"),
                      // title: Text(pokeallBloc.allpoke.result[index].name),
                      title: Text(nameresult[index]),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
