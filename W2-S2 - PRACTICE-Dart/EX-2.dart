class BankAccount {
  int accID;
  String accOwner;
  double _balance = 0.0;

  BankAccount ({required this.accID,  required this.accOwner});

  double get balance => _balance;

  void credit(double amount){
    _balance += amount;
  }

  void withDraw(double amount){
    if (amount > _balance){
      print("Insufficient balance for withdrawal!");
    }
    _balance -= amount;
  }

  @override
  String toString(){
    return "Id: $accID, Owner: $accOwner, Balance: \$$_balance";
  }
}

class Bank {
  String name;
  List<BankAccount> _acc = [];
  Bank ({required this.name});

  BankAccount createAccount(int accID, String accOwner){
    for (var acc in _acc) {
      if (acc.accID == _acc){
        print("Account with ID $accID already exists!");
      }
    }
    BankAccount newAccount = BankAccount(accID: accID, accOwner: accOwner);
    _acc.add(newAccount);
    return newAccount;
  }

  @override
  String toString(){
    return "Bank Name: $name, Accounts: $_acc"; 
    //${_acc.map((acc) => acc.toString()).join(', ')}"; // We can using this for Display Bank Account
  }
}
 
void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');
  
  print(ronanAccount);
  print(myBank);

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withDraw(50);
  print(ronanAccount.balance); // Balance: $50

  BankAccount? honglyAcc;
  try {
    ronanAccount.withDraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    honglyAcc = myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }

  print(honglyAcc);

}
