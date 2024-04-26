import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/funcrtions/check_internet.dart';
import 'package:e_commerce/core/class/stutus_request.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, var data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.statusCode.toDouble());
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFilure);
      }
    } catch (error) {
      print(error.toString());
      return const Left(StatusRequest.serverException);
    }
  }
}
