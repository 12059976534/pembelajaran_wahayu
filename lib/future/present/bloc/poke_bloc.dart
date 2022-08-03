import 'package:bloc/bloc.dart';
import 'package:fecth2/future/data/model/pokemodel.dart';
// import 'package:fecth2/future/domain/repo/pokerepo.dart';
import 'package:fecth2/future/home/domain/repo/pokerepo.dart';
import 'package:fecth2/future/present/bloc/poke_event.dart';
import 'package:fecth2/future/present/bloc/poke_state.dart';
import 'package:flutter/material.dart';

class PokeBloc extends Bloc<PokeEvent, PokeState> {
  // PokeBloc({@required PokeState initialState}) : super(initialState);
  PokeBloc({@required this.pokeRevo})
      : assert(pokeRevo != null),
        super(PokeInitial());
  final PokeRevo pokeRevo;
  Pokemodel pokemodel;

  @override
  Stream<PokeState> mapEventToState(PokeEvent event) async* {
    if (event is GetPoke) {
      yield PokeLoading();
      try {
        pokemodel = await pokeRevo.getPokeapi();
        if (pokemodel != null) {
          yield PokeLoaded(pokemodel);
        }
      } catch (e) {
        yield PokeError(e);
      }
    }
    // throw UnimplementedError();
  }
}
