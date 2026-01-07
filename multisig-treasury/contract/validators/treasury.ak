use cardano/transaction.{OutputReference, Transaction}
use aiken/collection/list
use aiken/crypto.{VerificationKeyHash}
use cardano/address.{Address}

type Datum {
  amount: Int,
  receiver: Address,
  signatures: List<Address>,
}

type Redeemer {
  Sign
  Update
  Execute
}

validator treasury (admins: List<Address>, threshold: Int, allowance: Int) {
  spend(
    datum_option: Option<Datum>,
    redeemer: Redeemer,
    output_reference: OutputReference,
    transaction: Transaction,
  ) {
    expect Some(datum) = datum_option
    let Transaction { extra_signatories, .. } = transaction

    when redeemer is {
      Sign -> True
      Update -> True
      Execute -> True
    }
  }

  else(_) {
    fail
  }
}
