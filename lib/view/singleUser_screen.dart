import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_dio/model/singleUser.dart';
import 'package:flutter_api_dio/model/userModel.dart';
import 'package:flutter_api_dio/services/http_services.dart';

class SingleUserScreen extends StatefulWidget {
  const SingleUserScreen({super.key});

  @override
  State<SingleUserScreen> createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  HttpServices? http;
  SingleUserResponse? singleUserResponse;
  bool isLoading = false;
  UserModel? user;

  Future getUser() async {
    Response response;
    try {
      isLoading = true;
      response = await http!.getRequest("/api/users/2", '');
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          singleUserResponse = SingleUserResponse.fromJson(response.data);
          user = singleUserResponse!.user;
        });
      } else {
        'There is some error';
      }
    } on Exception catch (e) {
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Demo'),
      ),
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) :  user != null ? ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(user!.avatar.toString()),
              title: Text(user!.first_name.toString()),
              subtitle: Text(user!.last_name.toString()),
            ),
          );
        },
        ) : const Center(
        child: Text('No Data')
        ),
    );
  }
}
