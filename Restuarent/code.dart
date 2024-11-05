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

class Order {
  OrderStatus _orderStatus = OrderStatus.Pending;
  PaymentStatus _paymentStatus = PaymentStatus.Unpaid;
  final List<Product> _items = []; 
  final Customer customer;
  final int quantity;
  double totalPrice = 0.0;

  Order({required this.customer, required this.quantity});

  void updateOrderStatus(OrderStatus status) => _orderStatus = status;
  void updatePaymentStatus(PaymentStatus status) => _paymentStatus = status;

  void addItem(Product item) {
    _items.add(item);
    calculateTotal();
  }

  void removeItem(Product item) {
    if (_items.remove(item)) {
      calculateTotal();
    } else {
      print("Item not found in order.");
    }
  }

  void calculateTotal() {
    totalPrice = 0.0;
    for (var item in _items) {
      totalPrice += item.price * quantity;
    }
  }

  void getReceipt() {
    print("Order Receipt:");
    for (var item in _items) {
      print("- ${item.name} (${item.category.name}), Quantity: $quantity");
    }
    print("Order Status: ${_orderStatus.name}, Payment Status: ${_paymentStatus.name}");
    print("Total Price: \$${totalPrice.toStringAsFixed(1)}");
  }
}

class TableReservation {
  final int reservationID;
  final int tableNum;
  final DateTime reservationDate;
  ReservationStatus _reservationStatus = ReservationStatus.Reserved;

  TableReservation({
    required this.reservationID,
    required this.tableNum,
    required this.reservationDate,
  });

  void updateReservationStatus(ReservationStatus status) {
    _reservationStatus = status;
  }

  void displayReservation() {
    print("Reservation: ${_reservationStatus.name}");
    print("ID: $reservationID, Table: $tableNum, Date: $reservationDate");
  }
}

class Customer {
  final String name;
  final String contactDetails;
  final List<Order> _orders = [];
  final List<TableReservation> _reservations = [];

  Customer({required this.name, required this.contactDetails});

  void placeOrder(Order order) => _orders.add(order);
  void reserveTable(TableReservation reservation) => _reservations.add(reservation);

  void displayInfo() {
    print("\nCustomer: $name, Contact: $contactDetails");
    for (var reservation in _reservations) {
      reservation.displayReservation();
    }
    for (var order in _orders) {
      order.getReceipt(); // Display order details for each order
    }
  }
}

class Menu {
  final List<Product> _menu = [];
  final List<Order> _orders = [];
  final List<TableReservation> _reservations = [];

  void addProduct(Product product) => _menu.add(product);
  void removeProduct(Product product) {
    if (_menu.remove(product)) {
      print("Product removed from the menu.");
    } else {
      print("Product not found in the menu.");
    }
  }

  void placeOrder(Order order) {
    _orders.add(order);
    print("Order placed for customer: ${order.customer.name}");
  }

  void reserveTable(TableReservation reservation) {
    _reservations.add(reservation);
    print("Table reserved for customer: ${reservation.tableNum}");
  }

  void displayMenu() {
    print("============== Menu ==============");
    for (var item in _menu) {
      print("${item.productID}, ${item.name}, Price: \$${item.price.toStringAsFixed(1)}, Category: ${item.category.name}");
    }
  }
}

void main() {
  // Create Menu Manager and add Products
  var menu = Menu();
  menu.addProduct(Product(productID: 11, name: "Pizza", price: 10.0, category: CategoryStatus.Food));
  menu.addProduct(Product(productID: 12, name: "Coca-Cola", price: 2.0, category: CategoryStatus.Drink));
  menu.addProduct(Product(productID: 13, name: "Pudding", price: 8.0, category: CategoryStatus.Dessert));

  // Display Menu
  menu.displayMenu();

  // Create Customers
  var customer1 = Customer(name: "Socheat", contactDetails: "0973577644");
  var customer2 = Customer(name: "Bunheng", contactDetails: "0973577644");

  // Add Table Reservations
  customer1.reserveTable(TableReservation(reservationID: 11, tableNum: 5, reservationDate: DateTime.now()));
  customer2.reserveTable(TableReservation(reservationID: 12, tableNum: 6, reservationDate: DateTime.now()));

  // Place Orders
  var order1 = Order(customer: customer1, quantity: 2);
  var order2 = Order(customer: customer2, quantity: 1);

  order1.addItem(menu._menu[0]); // Adds Pizza
  order2.addItem(menu._menu[1]); // Adds Coca-Cola

  customer1.placeOrder(order1);
  customer2.placeOrder(order2);

  // Update and display payment status
  order2.updatePaymentStatus(PaymentStatus.Paid);

  // Display Customer Info (orders and reservations)
  customer1.displayInfo();
  customer2.displayInfo();
}
