import 'package:dio/dio.dart';
import 'package:fecth2/future/data/model/pokemodel.dart';

class PokeApi {
  Pokemodel model = Pokemodel();
  Dio dio = Dio();
  var url = "https://pokeapi.co/api/v2/pokemon/ditto";
  Future<Pokemodel> getpokeapi() async {
    return await dio.get(url).then((dynamic res) {
      model = Pokemodel.fromjson(res.data);
      return model;
    });
  }
}
