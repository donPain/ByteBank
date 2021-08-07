// ignore: unused_import
import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_interceptor/models/request_data.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
    print('url:     ${data.baseUrl}');
    print('headers: ${data.headers}');
    print('body:    ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response');
    print('status code: $data.status_code');
    print('headers: $data.headers');
    print('body:    ${data.body}');
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response =
      await client.get(Uri.parse('http://192.168.0.7:8080/transactions'));
  final List<dynamic> decodedjson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactionJson in decodedjson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(transactionJson['value'],
        Contact(0, contactJson['name'], contactJson['accountNumber']));
    transactions.add(transaction);
  }
  return transactions;
}
