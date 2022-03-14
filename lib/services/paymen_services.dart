import 'package:cashfree_pg/cashfree_pg.dart';

void buttonTapHandler() {
  Map<String, String> inputParams = {
    "orderId": "1113",
    "orderAmount": "1000",
    "customerName": "MD ",
    "orderNote": "",
    "orderCurrency": "INR",
    "appId": "14331664b456f7bd89b68cf9e5613341",
    "customerPhone": "9409583829",
    "customerEmail": "mantastic2001@gmail.com",
    "stage": "TEST",
    "tokenData":
        "tk9JCN4MzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye.L39JCOjVjZwczYldjZyIjNiojI0xWYz9lIsUTM4EzN4kDN2EjOiAHelJCLiIlTJJiOik3YuVmcyV3QyVGZy9mIsICMwATMiojI05Wdv1WQyVGZy9mIsIyMxETMiojIklkclRmcvJye.dZu6QhyiUc1RSCNWL-GGL56kYxH2apJzWGZGXoLfI1XmmEK6YpCtsed8bwvyDjbnK6",
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