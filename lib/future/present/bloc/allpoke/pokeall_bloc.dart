import 'package:bloc/bloc.dart';
import 'package:fecth2/future/data/model/allpoke.dart';
import 'package:fecth2/future/home/domain/repo/pokeallrepo.dart';
// import 'package:fecth2/future/domain/repo/pokeallrepo.dart';
import 'package:flutter/material.dart';
import 'pokeall_event.dart';
import 'pokeall_state.dart';

class PokeallBloc extends Bloc<PokeallEvent, PokeallState> {
  PokeallBloc({@required this.pokeallRevo})
      : assert(pokeallRevo != null),
        super(PokeallInitial());
  final PokeallRevo pokeallRevo;
  Allpoke allpoke;

  @override
  Stream<PokeallState> mapEventToState(PokeallEvent event) async* {
    if (event is GetafilterPoke) {
      yield PokeallLoading();
      var lim = event.limit;
      var offset = event.offset;
      try {
        allpoke = await pokeallRevo.getpokeallapi(lim, offset);
        if (allpoke != null) {
          // yield PokeallLoaded(allpoke);
          yield PokeallfilterLoaded(allpoke);
        }
      } catch (e) {
        yield PokeallError(e);
      }
    }
    if (event is GetallPoke) {
      yield PokeallLoading();
      var lim = event.limit;
      var offset = event.offset;
      try {
        allpoke = await pokeallRevo.getpokeallapi(lim, offset);
        if (allpoke != null) {
          yield PokeallLoaded(allpoke);
        }
      } catch (e) {
        yield PokeallError(e);
      }
    }
    if (event is Getloadmore) {
      // yield PokeLoadmoreloading();
      // yield PokeallLoaded(allpoke);
      var lim = event.limit;
      var offset = event.offset;
      try {
        allpoke = await pokeallRevo.getpokeallapi(lim, offset);
        if (allpoke != null) {
          yield PokeallLoaded(allpoke);
        }
      } catch (e) {
        yield PokeallError(e);
      }
    }
    // throw UnimplementedError();
  }
}
