import 'package:fecth2/future/data/model/allpoke.dart';
import 'package:fecth2/future/data/model/pilihpoke.dart';
import 'package:fecth2/future/home/domain/api/apipilihpokemon.dart';
import 'package:fecth2/future/home/domain/api/pokeallApi.dart';
import 'package:flutter/cupertino.dart';

class GetlistDatapoke extends ChangeNotifier {
  Pilihpoke pilihpoke = Pilihpoke();
  bool loading = false;
  getpilihpoke(url) async {
    loading = true;
    pilihpoke = await Apipilihpokemon().getpokepilih(url);
    loading = false;
    notifyListeners();
  }
}
