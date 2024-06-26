import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/components/constants.dart';
import 'package:my_app/dto/balances.dart';
import 'package:my_app/dto/issues.dart';
import 'package:my_app/dto/news.dart';
import 'package:my_app/dto/ruangan.dart';
import 'package:my_app/dto/spendings.dart';
import 'package:my_app/endpoints/endpoint.dart';
import 'package:my_app/dto/datas.dart';
import 'package:my_app/utils/secure_storage_util.dart';

class DataService {
  static Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(Endpoint.news));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => News.fromJson(item)).toList();
    } else {
      throw Exception('Failed to Load News!');
    }
  }

  static Future<void> sendNews(String title, String body) async {
    Map<String, String> newsData = {
      "title": title,
      "body": body,
    };
    String jsonData = jsonEncode(newsData);
    await http.post(Uri.parse(Endpoint.news),
        body: jsonData, headers: {'Content-Type': 'application/json'});
  }

  static Future<void> deleteNews(String id) async {
    await http.delete(Uri.parse('${Endpoint.news}/$id'),
        headers: {'Content-type': 'application/json'});
  }

  static Future<void> updateNews(String id, String title, String body) async {
    Map<String, String> data = {"id": id, "title": title, "body": body};
    String jsonData = jsonEncode(data);
    await http.put(Uri.parse('${Endpoint.news}/$id'),
        body: jsonData, headers: {'Content-type': 'application/json'});
  }

  static Future<List<Datas>> fetchDatas() async {
    final response = await http.get(Uri.parse(Endpoint.datas));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Datas.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  }

  static Future<void> deleteDatas(String id) async {
    await http.delete(Uri.parse('${Endpoint.datas}/$id'),
        headers: {'Content-type': 'application/json'});
  }

  static Future<void> updateDatas(int id, String name, String? imageUrl) async {
    Map<String, dynamic> data = {
      "id_datas": id,
      "name": name,
      "imageUrl": imageUrl,
      // Jika ada field lain yang perlu di-update, tambahkan di sini
    };
    String jsonData = jsonEncode(data);
    await http.put(Uri.parse('${Endpoint.datas}/$id'),
        body: jsonData, headers: {'Content-type': 'application/json'});
  }

  // DATA SERVICE UTS

  static Future<List<Issues>> fetchIssues() async {
    final response = await http.get(Uri.parse(Endpoint.datasuts));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Issues.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Issues>> fetchIssuesNIM() async {
    final response = await http.get(Uri.parse(Endpoint.dataNIM));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Issues.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  }

  static Future<void> deleteIssues(String id) async {
    // kalu tidak jalan hubungi yang berkepentingan seperti tuhan, atau ganti id jadi String
    await http.delete(Uri.parse('${Endpoint.datasuts}/$id'),
        headers: {'Content-type': 'application/json'});
  }

  static Future<void> deleteIssuesNIM(String id) async {
    await http.delete(Uri.parse('${Endpoint.dataNIM}/$id'),
        headers: {'Content-type': 'application/json'});
  }

  // pake ini kalo 1 aja fieldnya
  // static Future<List<News>> fetchNews() async {
  //   final response = await http.get(Uri.parse(Endpoint.news));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> jsonResponse = jsonDecode(response.body);
  //     return jsonResponse.map((item) => News.fromJson(item)).toList();
  //   } else {
  //     throw Exception('Failed to Load News!');
  //   }
  // }

  static Future<List<Balances>> fetchBalances() async {
    final response = await http.get(Uri.parse(Endpoint.balance));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Balances.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Spendings>> fetchSpendings() async {
    final response = await http.get(Uri.parse(Endpoint.spending));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Spendings.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<http.Response> sendSpendingData(int spending) async {
    final url = Uri.parse(Endpoint.spending);
    final data = {'spending': spending};

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response;
  }

  //post login with email and password
  static Future<http.Response> sendLoginData(
      String email, String password) async {
    final url = Uri.parse(Endpoint.login);
    final data = {'email': email, 'password': password};
    final response = await http.post(
      url,
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(data),
    );
    return response;
  }


  static Future<http.Response> logoutData() async {
    final url = Uri.parse(Endpoint.logout);
    final String? accessToken =
        await SecureStorageUtil.storage.read(key: tokenStoreName);
    debugPrint("logout with $accessToken");

    final response = await http.post(url, headers: {
      'Context-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    });
    return response;
  }

  static Future<List<Ruangan>> fetchRuangan() async {
    final response = await http.get(Uri.parse(Endpoint.ruanganRead));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Ruangan.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }
}
