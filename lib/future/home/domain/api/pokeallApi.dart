import 'package:dio/dio.dart';
import 'package:fecth2/future/data/model/allpoke.dart';

class PokeallApi {
  Allpoke model = Allpoke();
  Dio dio = Dio();
  Future<Allpoke> getpokeallapi(limit, offset) async {
    print("=======in api services======");
    print(limit);
    print(offset);
    print("=======in api services======");
    var url =
        "https://pokeapi.co/api/v2/pokemon/?offset=${offset}&limit=${limit}";
    return await dio.get(url).then((dynamic res) {
      model = Allpoke.fromjson(res.data);
      return model;
    });
  }
}
// https://pokeapi.co/api/v2/pokemon/?offset=0&limit=5