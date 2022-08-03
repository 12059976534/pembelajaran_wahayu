import 'package:bloc/bloc.dart';
import 'package:fecth2/future/data/model/allpoke.dart';
import 'package:fecth2/future/home/domain/repo/pokeallrepo.dart';
// import 'package:fecth2/future/domain/repo/pokeallrepo.dart';
import 'package:flutter/material.dart';
import 'pokeasearch_event.dart';
import 'pokeasearch_state.dart';

class PokeSearchBloc extends Bloc<PokeSearchEvent, PokesearchState> {
  PokeSearchBloc({@required this.pokeallRevo})
      : assert(pokeallRevo != null),
        super(PokesearchInitial());
  final PokeallRevo pokeallRevo;
  Allpoke allpoke;

  @override
  Stream<PokesearchState> mapEventToState(PokeSearchEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetaSearcPoke) {
      yield PokesearchLoading();
      var lim = event.limit;
      var offset = event.offset;
      try {
        allpoke = await pokeallRevo.getpokeallapi(lim, offset);
        if (allpoke != null) {
          yield PokeserchLoaded(allpoke);
        }
      } catch (e) {
        yield PokesearchError(e);
      }
    }
    if (event is Getloadmoresearch) {
      var lim = event.limit;
      var offset = event.offset;
      try {
        allpoke = await pokeallRevo.getpokeallapi(lim, offset);
        if (allpoke != null) {
          yield PokeserchLoaded(allpoke);
        }
      } catch (e) {
        yield PokesearchError(e);
      }
    }
    // throw UnimplementedError();
  }
}
