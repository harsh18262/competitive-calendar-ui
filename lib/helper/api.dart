import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class Contest {
  // ignore: deprecated_member_use
  List<Article> articles = [];
  String ip =
      "https://raw.githubusercontent.com/competitive-kalendar/data-repo/main/";
  Future<void> getContestData() async {
    final String url = ip + "contests";
  
    var respone = await http.get(Uri.parse(url));

    List jsonData = json.decode(respone.body);
    //print(jsonData);

    if (respone.statusCode == 200) {
      add_to_articles(jsonData);
    }
  }

  Future<void> getContestDataCodechef() async {
    final String url = ip + "codechef/contests";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      add_to_articles(jsonData);
    }
  }

  Future<void> getContestDataCodeForces() async {
    final String url = ip + "codeforces/contests";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      add_to_articles(jsonData);
    }
  }

  Future<void> getContestDataHackerRank() async {
    final String url = ip + "hackerrank/contests";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      add_to_articles(jsonData);
    }
  }

  Future<void> getContestDataHackerEarth() async {
    final String url = ip + "hackerearth/contests";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      add_to_articles(jsonData);
    }
  }

  Future<void> getContestDataPhaseRunning() async {
    final String url = ip + "running";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      add_to_articles(jsonData);
    }
  }

  Future<void> getContestDataPhaseUpcoming() async {
    final String url = ip + "upcoming";
    var response = await http.get(Uri.parse(url));
    List jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      add_to_articles(jsonData);
    }
  }

  Future<void> add_to_articles(List jsonData) async {
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
