class MenuItem {
  final String name;
  final String type;
  double price;

  MenuItem (this.name, this.price, this.type);
}

class Menu {
  List<MenuItem> items = [];

  void addMenuItem(MenuItem item) {
    items.add(item);
  }
  void removeMenuItem(MenuItem item) {
    items.remove(item);
  }
}

class Order {
  int orderID;
  List<MenuItem> items = [];
  String status; // e.g., Pending, Completed
  double totalPrice = 0.0;
  String paymentStatus;

  Order(this.orderID, this.status, this.paymentStatus);
   
  void addItem(MenuItem item) {
    items.add(item);
    calculateTotal();
  }

  void removeItem(MenuItem item) {
    items.remove(item);
    calculateTotal();
  }

  void calculateTotal() {
    totalPrice = items.fold(0.0, (sum, item) => sum + item.price);
  }

  void changeStatus(String status) {
    this.status = status;
  }

  void changePaymentStatus(String paymentStatus) {
    this.paymentStatus = paymentStatus;
  }
}

class TableReservation {
  int reservationID;
  int tableNumber;
  DateTime date;
  String status; // Reserved, Available

  TableReservation(this.reservationID, this.tableNumber, this.date, this.status);

  void reserveTable(int tableNumber, DateTime date) {
    this.tableNumber = tableNumber;
    this.date = date;
    this.status = 'Reserved';
  }

  void cancelReservation(int reservationID) {
    if (this.reservationID == reservationID) {
      this.status = 'Available';
    }
  }
}

// Customer class
class Customer {
  String firstName;
  String lastName;
  List<Order> orders = [];
  List<TableReservation> reservations = [];

  Customer(this.firstName, this.lastName);

  void placeOrder(Order order) {
    orders.add(order);
  }

  void reserveTable(TableReservation reservation) {
    reservations.add(reservation);
  }
}

void main() {
  // Create a new menu and menu items
  Menu menu = Menu();
  MenuItem burger = MenuItem('Burger', 5.99, 'Food');
  MenuItem cola = MenuItem('Cola', 1.99, 'Drink');
  
  menu.addMenuItem(burger);
  menu.addMenuItem(cola);

  // Create a new customer
  Customer customer = Customer('John', 'Doe');

  // Create an order
  Order order = Order(1, 'Pending', 'Unpaid');
  order.addItem(burger);
  order.addItem(cola);

  // Customer places an order
  customer.placeOrder(order);

  // Create a table reservation
  TableReservation reservation = TableReservation(1, 101, DateTime.now(), 'Reserved');
  customer.reserveTable(reservation);

  print('Customer ${customer.firstName} ${customer.lastName} placed an order of total \$${order.totalPrice}');
  print('Reserved table: ${reservation.tableNumber} on ${reservation.date}');
}