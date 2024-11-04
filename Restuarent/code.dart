enum OrderStatus { Pending, Completed, Cancelled }
enum PaymentStatus { Unpaid, Paid }
enum ReservationStatus { Reserved, Cancelled }
enum CategoryStatus { Food, Drink, Dessert }

class Product {
  final int productID;
  final String name;
  final double price;
  final CategoryStatus category;

  Product({
    required this.productID,
    required this.name,
    required this.price,
    required this.category,
  });
}

class MenuManager {
  final List<Product> items = [];

  void addItem(Product item) => items.add(item);
  void removeItem(Product item) {
    if (items.remove(item)) {
      print("Item removed from menu.");
    } else {
      print("Item not found in the menu.");
    }
  }

  void displayProduct() {
    print("============== Menu ==============");
    for (var item in items) {
      print("${item.productID}, ${item.name}, Price: \$${item.price}, Category: ${item.category.name}");
    }
  }
}

class Order {
  OrderStatus orderStatus = OrderStatus.Pending;
  PaymentStatus paymentStatus = PaymentStatus.Unpaid;
  final List<Product> items = [];
  final Customer customer;
  final int quantity;
  double totalPrice = 0.0;

  Order({ required this.customer, required this.quantity });

  void setOrderstatus(OrderStatus status) => orderStatus = status;
  void setPaymentStatus(PaymentStatus status) => paymentStatus = status;

  void addItem(Product item) {
    items.add(item);
    calculateTotal();
  }

  void removeItem(Product item) {
    if (items.remove(item)) {
      calculateTotal();
    } else {
      print("Item not found in order.");
    }
  }

  void calculateTotal() {
    totalPrice = 0.0;
    for (var item in items) {
      totalPrice += item.price * quantity;
    }
  }

  void getReceipt() {
    print("Order Receipt:");
    for (var item in items) {
      print("- ${item.name} (${item.category.name}), Quantity: $quantity");
    }
    print("Order Status: ${orderStatus.name}, Payment Status: ${paymentStatus.name}");
    print("Total Price: \$${totalPrice}");
  }
}

class TableReservation {
  final int reservationID;
  final int tableNum;
  final DateTime reservationDate;
  ReservationStatus reservationStatus = ReservationStatus.Reserved;

  TableReservation({ required this.reservationID, required this.tableNum, required this.reservationDate });

  void updateReservationStatus(ReservationStatus status) {
    reservationStatus = status;
  }

  void displayReservation() {
    print("Reservation: ${reservationStatus.name}");
    print("ID: $reservationID, Table: $tableNum, Date: $reservationDate");
  }
}

class Customer {
  final String name;
  final String contactDetails;
  final List<Order> orders = [];
  final List<TableReservation> reservations = [];

  Customer({ required this.name, required this.contactDetails });

  void placeOrder(Order order) => orders.add(order);
  void reserveTable(TableReservation reservation) => reservations.add(reservation);

  void displayInfo() {
    print("\nCustomer: $name, Contact: $contactDetails");
    for (var reservation in reservations) {
      reservation.displayReservation();
    }
    for (var order in orders) {
      order.getReceipt();
    }
  }             
}

void main() {
  
  var customer1 = Customer(name: "Socheat", contactDetails: "0973577644");
  var customer2 = Customer(name: "Bunheng", contactDetails: "0973577644");
  // Add table reservations
  customer1.reserveTable(TableReservation(reservationID: 11, tableNum: 5, reservationDate: DateTime.now()));
  customer2.reserveTable(TableReservation(reservationID: 12, tableNum: 6, reservationDate: DateTime.now()));
  // menu items
  var menuManager = MenuManager();
  var item1 = Product(productID: 11, name: "Pizza", price: 10.0, category: CategoryStatus.Food);
  var item2 = Product(productID: 12, name: "Soda", price: 2.0, category: CategoryStatus.Drink);
  var item3 = Product(productID: 13, name: "Ice Cream", price: 8.0, category: CategoryStatus.Dessert);
  // add to Menu
  menuManager.addItem(item1);
  menuManager.addItem(item2);
  menuManager.addItem(item3);
  // orders
  var order1 = Order(customer: customer1, quantity: 2);
  var order2 = Order(customer: customer2, quantity: 12);
  order1.addItem(item1);
  order2.addItem(item2);
  customer1.placeOrder(order1);
  customer2.placeOrder(order2);
  // update payment status for order2
  order2.setPaymentStatus(PaymentStatus.Paid);
  // display menu
  menuManager.displayProduct();
  // display customer orders and reservations
  customer1.displayInfo();
  customer2.displayInfo();
}
