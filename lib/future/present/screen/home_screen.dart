import 'dart:async';

import 'package:fecth2/future/data/model/pokemodel.dart';
import 'package:fecth2/future/home/domain/repo/pokerepo.dart';
// import 'package:fecth2/future/domain/repo/pokerepo.dart';
import 'package:fecth2/future/present/bloc/poke_bloc.dart';
import 'package:fecth2/future/present/bloc/poke_event.dart';
import 'package:fecth2/future/present/bloc/poke_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PokeBloc pokeBloc = PokeBloc(pokeRevo: PokeRevo());
  Pokemodel pokemodel = Pokemodel();
  bool noConnection = false, isLoading = false, hasReachedMax = false;
  ScrollController _scrollController = new ScrollController();
  List myProducts = ["start", "leo", "mami", "siple"];
  @override
  void dispose() {
    pokeBloc.close();
    super.dispose();
  }

  var isload = false;
  @override
  void initState() {
    super.initState();
    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          isload = true;
          print("haiiiiii");
        });
      }
      var time = const Duration(seconds: 3);
      Timer(time, () {
        setState(() {
          isload = false;
        });
        print("Load sekarangg");
        print(_scrollController.position.pixels.toString());
      });
    });
  }

  // ignore: missing_return
  Future<void> _getData() {
    pokeBloc.add(GetPoke());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PokeBloc, PokeState>(
      cubit: pokeBloc,
      listener: (_, PokeState state) {
        if (state is PokeLoading) {
          setState(() {
            noConnection = false;
          });
        }
        if (state is PokeLoaded) {
          setState(() {
            pokemodel = state.pokemodel;
          });
        }
        if (state is PokeError) {
          setState(() {
            noConnection = true;
          });
        }
      },
      child: BlocBuilder<PokeBloc, PokeState>(
        cubit: pokeBloc,
        // ignore: missing_return
        builder: (_, PokeState state) {
          // if (state is PokeLoading) {}
          if (state is PokeLoaded) {
            return lisofdata(context);
          }
          if (state is PokeLoading) {
            return loading();
          }
          if (state is PokeError) {
            return loading();
          }
        },
      ),
    );
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget error() {
    return Text("erorr");
  }

  Widget lisofdata(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: pokemodel.abiities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pokemodel.abiities[index].ability.name),
          );
        },
      ),
    );
  }
}
