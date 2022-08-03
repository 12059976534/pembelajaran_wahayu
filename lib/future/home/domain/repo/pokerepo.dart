import 'package:fecth2/future/data/model/pokemodel.dart';
import 'package:fecth2/future/home/domain/api/pokeApi.dart';
// import 'package:fecth2/future/domain/api/pokeApi.dart';

class PokeRevo {
  PokeApi pokeApi = PokeApi();
  Future<Pokemodel> getPokeapi() => pokeApi.getpokeapi();
}
