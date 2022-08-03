import 'package:fecth2/future/data/model/allpoke.dart';
import 'package:fecth2/future/home/domain/api/pokeallApi.dart';
import 'package:flutter/cupertino.dart';

class GetlistDatapoke extends ChangeNotifier {
  Allpoke allpoke = Allpoke();
  bool loading = false;

  List<Result> result = [];
  List check = [];
  // List pilihan = [];

  plusresoult(Result data) {
    if (result.length < 5) {
      result.add(data);
    }
    notifyListeners();
  }

  minusresoult(Result data) {
    result.remove(data);
    notifyListeners();
  }

  getpoke() async {
    loading = true;
    allpoke = await PokeallApi().getpokeallapi(500, 0);
    for (int i = 0; i < allpoke.result.length; i++) {
      // var ischeck : false;
      check.add({
        "ischeck": false,
        "url": allpoke.result[i].url,
        "name": allpoke.result[i].name
      });
    }
    loading = false;
    notifyListeners();
  }
}
