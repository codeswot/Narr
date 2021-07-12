// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Transaction on TransactionBase, Store {
  final _$blockchainTransactionAtom =
      Atom(name: 'TransactionBase.blockchainTransaction');

  @override
  dynamic get blockchainTransaction {
    _$blockchainTransactionAtom.reportRead();
    return super.blockchainTransaction;
  }

  @override
  set blockchainTransaction(dynamic value) {
    _$blockchainTransactionAtom.reportWrite(value, super.blockchainTransaction,
        () {
      super.blockchainTransaction = value;
    });
  }

  final _$TransactionBaseActionController =
      ActionController(name: 'TransactionBase');

  @override
  void getBlockchainTransaction(dynamic tranx) {
    final _$actionInfo = _$TransactionBaseActionController.startAction(
        name: 'TransactionBase.getBlockchainTransaction');
    try {
      return super.getBlockchainTransaction(tranx);
    } finally {
      _$TransactionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
blockchainTransaction: ${blockchainTransaction}
    ''';
  }
}
