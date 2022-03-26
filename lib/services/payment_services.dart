import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ikigai/controllers/user_controller.dart';
import '../models/event_model.dart';
import 'dart:convert';

UserController userController = Get.find();

Future<String> bookingForOrganizeEvent(EventModel event) async {
  String userId = userController.uid.value;
  String orderId = "${event.eventId}${userId}";
  String token = await getToken(orderId, event.ticketPrice!);

  Map<String, String> inputParams = {
    "orderId": orderId,
    "orderAmount": event.ticketPrice.toString(),
    "customerName": "MD",
    "orderNote": "",
    "orderCurrency": "INR",
    "appId": "14331664b456f7bd89b68cf9e5613341",
    "customerPhone": "9409583829",
    "customerEmail": "mantastic2001@gmail.com",
    "stage": "TEST",
    "tokenData": token,
    "notifyUrl": ""
  };
  CashfreePGSDK.doPayment(inputParams)
      .then((value) => value?.forEach((key, value) {
            // this.responseRecieved();
            print("$key : $value");
            // response+=
            //Do something with the result
          }))
      .catchError((err) => print('error : ' + err.toString()));

// make return message according to so we can
  return "SUCCESS";
}

Future<String> registerMatrixSlot(
    String price, String date, String seat, String slot) async {
  String userId = userController.uid.value;
  String orderId = "${userId}_${date}_${seat}_${slot}";
  String token = await getToken(orderId, price);

  Map<String, String> inputParams = {
    "orderId": orderId,
    "orderAmount": price.toString(),
    "customerName": "MD",
    "orderNote": "",
    "orderCurrency": "INR",
    "appId": "14331664b456f7bd89b68cf9e5613341",
    "customerPhone": "9409583829",
    "customerEmail": "mantastic2001@gmail.com",
    "stage": "TEST",
    "tokenData": token,
    "notifyUrl": ""
  };
  CashfreePGSDK.doPayment(inputParams)
      .then((value) => value?.forEach((key, value) {
            // this.responseRecieved();
            print("$key : $value");
            // response+=
            //Do something with the result
          }))
      .catchError((err) => print('error : ' + err.toString()));

  return "SUCCESS";
}

void registerEvent(EventModel event) async {
  String userId = userController.uid.value;
  String orderId = "${event.eventId}${userId}";
  String token = await getToken(orderId, event.ticketPrice!);

  Map<String, String> inputParams = {
    "orderId": orderId,
    "orderAmount": event.ticketPrice.toString(),
    "customerName": "MD",
    "orderNote": "",
    "orderCurrency": "INR",
    "appId": "14331664b456f7bd89b68cf9e5613341",
    "customerPhone": "9409583829",
    "customerEmail": "mantastic2001@gmail.com",
    "stage": "TEST",
    "tokenData": token,
    "notifyUrl": ""
  };
  CashfreePGSDK.doPayment(inputParams)
      .then((value) => value?.forEach((key, value) {
            // this.responseRecieved();
            print("$key : $value");
            // response+=
            //Do something with the result
          }))
      .catchError((err) => print('error : ' + err.toString()));
}

Future<String> getToken(String orderId, String? price) async {
  final response = await http.post(
    Uri.parse('https://test.cashfree.com/api/v2/cftoken/order'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'x-client-id': '14331664b456f7bd89b68cf9e5613341',
      'x-client-secret': 'de3f3db29ee368fe890bfe4439135ace74897bda'
    },
    body: jsonEncode(<String, String>{
      "orderId": orderId,
      "orderAmount": price!,
      "orderCurrency": "INR"
    }),
  );

  var res = await json.decode(response.body);
  String ans = res["cftoken"];
  return ans;
}