class Allpoke {
  String next, previous;
  int count;
  List<Result> result;
  Allpoke({this.next, this.previous, this.count, this.result});
  Allpoke.fromjson(Map<String, dynamic> json) {
    next = json["next"];
    previous = json["previous"];
    count = json["count"];
    result = List<Result>.from(json["results"].map((x) => Result.fromjson(x)));
  }
}

class Result {
  String name, url;
  Result({this.name, this.url});

  Result.fromjson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}
