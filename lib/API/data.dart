import 'dart:convert';
import 'package:competitive_calendar/API/models.dart';
import 'package:http/http.dart' as http;

class Contest {
  // ignore: deprecated_member_use
  List<Article> articles = List<Article>();

  Future<void> getContestData() async {
    final String url = "http://3.14.72.85/api/contests/";
    var respone = await http.get(Uri.parse(url));
    List jsonData = json.decode(respone.body);

    if (respone.statusCode == 200) {
      for (int i = 0; i < jsonData.length; i++) {
        Article article = Article();
        article.name = jsonData[i]["name"];
        article.url = jsonData[i]["url"];
        article.platform = jsonData[i]["platform"];
        article.phase = jsonData[i]["phase"];
        article.startdate = DateTime.parse(jsonData[i]["start_time"]);
        article.enddate = DateTime.parse(jsonData[i]["end_time"]);
        articles.add(article);
      }
    }
  }

  Future<void> getContestDataCodechef() async {
    final String url = "http://3.14.72.85/api/contests?platform=codechef";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < jsonData.length; i++) {
        Article article = Article();
        article.name = jsonData[i]["name"];
        article.url = jsonData[i]["url"];
        article.platform = jsonData[i]["platform"];
        article.phase = jsonData[i]["phase"];
        article.startdate = DateTime.parse(jsonData[i]["start_time"]);
        article.enddate = DateTime.parse(jsonData[i]["end_time"]);
        articles.add(article);
      }
    }
  }

  Future<void> getContestDataCodeForces() async {
    final String url = "http://3.14.72.85/api/contests?platform=codeforces";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < jsonData.length; i++) {
        Article article = Article();
        article.name = jsonData[i]["name"];
        article.url = jsonData[i]["url"];
        article.platform = jsonData[i]["platform"];
        article.phase = jsonData[i]["phase"];
        article.startdate = DateTime.parse(jsonData[i]["start_time"]);
        article.enddate = DateTime.parse(jsonData[i]["end_time"]);
        articles.add(article);
      }
    }
  }

  Future<void> getContestDataHackerRank() async {
    final String url = "http://3.14.72.85/api/contests?platform=hackerrank";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < jsonData.length; i++) {
        Article article = Article();
        article.name = jsonData[i]["name"];
        article.url = jsonData[i]["url"];
        article.platform = jsonData[i]["platform"];
        article.phase = jsonData[i]["phase"];
        article.startdate = DateTime.parse(jsonData[i]["start_time"]);
        article.enddate = DateTime.parse(jsonData[i]["end_time"]);
        articles.add(article);
      }
    }
  }

  Future<void> getContestDataHackerEarth() async {
    final String url = "http://3.14.72.85/api/contests?platform=hackerearth";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < jsonData.length; i++) {
        Article article = Article();
        article.name = jsonData[i]["name"];
        article.url = jsonData[i]["url"];
        article.platform = jsonData[i]["platform"];
        article.phase = jsonData[i]["phase"];
        article.startdate = DateTime.parse(jsonData[i]["start_time"]);
        article.enddate = DateTime.parse(jsonData[i]["end_time"]);
        articles.add(article);
      }
    }
  }

  Future<void> getContestDataPhaseRunning() async {
    final String url = "http://3.14.72.85/api/contests?phase=running";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < jsonData.length; i++) {
        Article article = Article();
        article.name = jsonData[i]["name"];
        article.url = jsonData[i]["url"];
        article.platform = jsonData[i]["platform"];
        article.phase = jsonData[i]["phase"];
        article.startdate = DateTime.parse(jsonData[i]["start_time"]);
        article.enddate = DateTime.parse(jsonData[i]["end_time"]);
        articles.add(article);
      }
    }
  }
}
