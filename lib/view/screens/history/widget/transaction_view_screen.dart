import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynt/controller/transaction_history_controller.dart';
import 'package:mynt/data/model/transaction_model.dart';
import 'package:mynt/util/dimensions.dart';
import 'package:mynt/view/base/no_data_screen.dart';
import 'package:mynt/view/screens/history/widget/history_shimmer.dart';


import 'transaction_history_card_view.dart';
class TransactionViewScreen extends StatelessWidget {
  final ScrollController scrollController;
  final bool isHome;
  final String type;
  const TransactionViewScreen({Key key, this.scrollController, this.isHome, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionHistoryController>(builder: (transactionHistory){
      List<Transactions> transactionList = transactionHistory.transactionList;

      if(!isHome) {
        transactionList = [];
        if (Get.find<TransactionHistoryController>().transactionTypeIndex == 0) {
          transactionList = transactionHistory.transactionList;
        } else if (Get.find<TransactionHistoryController>().transactionTypeIndex == 1) {
          transactionList = transactionHistory.sendMoneyList;
        }  else if (Get.find<TransactionHistoryController>().transactionTypeIndex == 2) {
          transactionList = transactionHistory.cashInMoneyList;
        }else if (Get.find<TransactionHistoryController>().transactionTypeIndex == 3){
          transactionList = transactionHistory.addMoneyList;
        }else if (Get.find<TransactionHistoryController>().transactionTypeIndex == 4){
          transactionList = transactionHistory.receivedMoneyList;
        }else if (Get.find<TransactionHistoryController>().transactionTypeIndex == 5){
          transactionList = transactionHistory.cashOutList;
        }
      }

      return  Column(children: [!transactionHistory.firstLoading ? transactionList.length != 0 ?
      Padding(
         padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: transactionList.length,
              itemBuilder: (ctx,index){
               return Container(
                   child: TransactionHistoryCardView(transactions: transactionList[index]));
             }),
      ) : NoDataFoundScreen(fromHome: isHome): HistoryShimmer(),

        transactionHistory.isLoading ? Center(child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
        )) : SizedBox.shrink(),
      ],);



    });
  }
}
