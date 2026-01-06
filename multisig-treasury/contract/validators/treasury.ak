use cardano/transaction.{OutputReference, Transaction}
use aiken/collection/list
use aiken/crypto.{VerificationKeyHash}
use

validator treasury {
  spend(
    _datum_option: Option<Data>,
    _redeemer: Void,
    _output_reference: OutputReference,
    _transaction: Transaction,
  ) {
    True
  }

  else(_) {
    fail
  }
}
