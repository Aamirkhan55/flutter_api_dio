import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_dio/model/singleUser.dart';
import 'package:flutter_api_dio/services/http_services.dart';

class SingleUserScreen extends StatefulWidget {
  const SingleUserScreen({super.key});

  @override
  State<SingleUserScreen> createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {

  HttpServices? http;
  SingleUserResponse? singleUserResponse;

  void getUser() async{
    Response response;

    try {
      response = await http!.getRequest("/api/users/2", '');
      if (response.statusCode == 200) {
        setState(() {
          singleUserResponse = SingleUserResponse.fromJson(response.data);
        });
      } else {
        'There is some error';
      }
    }on Exception catch (e) {
     e.toString(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Api Demo'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}