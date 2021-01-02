import 'package:sejutacita_test/api/api_base_helper.dart';
import 'package:sejutacita_test/configs/config.dart';
import 'package:sejutacita_test/models/models.dart';

class GithubRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<dynamic>> fetchGithubUsersList(
      String query, String category, int page) async {
    final response = await _helper
        .get('${Constants.baseUrl}/$category?q=$query&page=$page&per_page=10');

    if (category == 'users') {
      return UserListResponse.fromJson(response).results;
    } else if (category == 'issues') {
      return IssuesListResponse.fromJson(response).results;
    } else if (category == 'repositories') {
      return RepositoriesListResponse.fromJson(response).results;
    }
  }
}

class UserListResponse {
  List<Item> results;

  UserListResponse.fromJson(Map<String, dynamic> obj) {
    if (obj['items'] != null) {
      results = new List<Item>();
      obj['items'].forEach((v) {
        results.add(new Item.fromJson(v));
      });
    }
  }
}

class IssuesListResponse {
  List<IssuesItem> results;

  IssuesListResponse.fromJson(Map<String, dynamic> obj) {
    if (obj['items'] != null) {
      results = new List<IssuesItem>();
      obj['items'].forEach((v) {
        results.add(new IssuesItem.fromJson(v));
      });
    }
  }
}

class RepositoriesListResponse {
  List<RepositoriesItem> results;

  RepositoriesListResponse.fromJson(Map<String, dynamic> obj) {
    if (obj['items'] != null) {
      results = new List<RepositoriesItem>();
      obj['items'].forEach((v) {
        results.add(new RepositoriesItem.fromJson(v));
      });
    }
  }
}
