import 'package:dio/dio.dart';
import 'dart:async';

// or new Dio with a BaseOptions instance.
BaseOptions options = new BaseOptions(
    baseUrl: "http://107.182.181.138:3030/mock/42",
    connectTimeout: 5000,
    receiveTimeout: 3000,
);
Dio request = new Dio(options);
