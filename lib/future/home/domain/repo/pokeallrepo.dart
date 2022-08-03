import 'package:fecth2/future/data/model/allpoke.dart';
import 'package:fecth2/future/home/domain/api/pokeallApi.dart';
// import 'package:fecth2/future/domain/api/pokeallApi.dart';

class PokeallRevo {
  PokeallApi pokeallApi = PokeallApi();
  Future<Allpoke> getpokeallapi(limit, offset) {
    return pokeallApi.getpokeallapi(limit, offset);
  }
}
