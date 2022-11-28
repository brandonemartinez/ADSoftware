
abstract class Jsonable {
  Map<String, dynamic> toJson();

  static List<dynamic>? toJsonList(List<Jsonable?>? list) {
    List<dynamic>? result;

    if (list != null) {
      result = [];
      for (var i in list) {
        result.add(i!.toJson());
      }
    }

    return result;
  }
}
