import 'BaseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> recentBooks() {
    return BaseNetwork.get("recent");
  }

  Future<Map<String, dynamic>> searchBooks(String QueryDiterima) {
    String Query = QueryDiterima.toString();
    return BaseNetwork.get("search/$Query");
  }

  Future<Map<String, dynamic>> detailsbook(String idDiterima) {
    String id = idDiterima;
    return BaseNetwork.get("books/$id");
  }
}
