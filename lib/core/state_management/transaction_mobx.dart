import 'package:mobx/mobx.dart';

part 'transaction_mobx.g.dart';

class Transaction = TransactionBase with _$Transaction;

abstract class TransactionBase with Store {
  @observable
  dynamic blockchainTransaction;

  @action
  void getBlockchainTransaction(dynamic tranx) {
    blockchainTransaction = tranx;
  }
}
