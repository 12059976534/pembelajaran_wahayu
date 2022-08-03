import 'package:dio/dio.dart';
import 'package:fecth2/future/data/model/pilihpoke.dart';

class Apipilihpokemon {
  Pilihpoke pilihpoke = Pilihpoke();
  Dio dio = Dio();
  Future<Pilihpoke> getpokepilih(urldata) async {
    final url = urldata;
    return await dio.get(url).then((dynamic res) {
      pilihpoke = Pilihpoke.fromjson(res.data);
      return pilihpoke;
    });
  }
}
