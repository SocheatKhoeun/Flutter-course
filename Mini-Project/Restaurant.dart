enum OrderStatus { Pending, Completed, Cancelled }
enum PaymentStatus { Unpaid, Paid }
enum ReservationStatus { Reserved, Cancelled }
enum MenuCategory { Food, Drink, Dessert }

class Menu {
  final String name;
  final double price;
  final MenuCategory category;

  Menu({required this.name, required this.price, required this.category});
}

class MenuManager {
  final List<Menu> items = [];

  void addItem(Menu item) => items.add(item);
  void removeItem(Menu item) => items.remove(item);

  void displayMenu() {
    for (var item in items) {
      print("Item: ${item.name}, Price: \$${item.price}, Category: ${item.category.name}");
    }
  }
}

class Order {
  final List<Menu> items = [];
  OrderStatus _orderStatus = OrderStatus.Pending;
  PaymentStatus _paymentStatus = PaymentStatus.Unpaid;
  double totalPrice = 0.0;

  OrderStatus get orderStatus => _orderStatus;
  PaymentStatus get paymentStatus => _paymentStatus;

  void addItem(Menu item) {
    items.add(item);
    totalPrice += item.price; 
  }

  void removeItem(Menu item) {
    if (items.contains(item)) {
      items.remove(item);
      totalPrice -= item.price; 
    } else {
      print("Item not found in order.");
    }
  }

  void updateOrderStatus(OrderStatus status) => _orderStatus = status;
  void updatePaymentStatus(PaymentStatus status) => _paymentStatus = status;
}

class TableReservation {
  final int tableNum;
  final DateTime reservationDate;
  ReservationStatus _reservationStatus = ReservationStatus.Reserved;

  TableReservation({required this.tableNum, required this.reservationDate});
  ReservationStatus get reservationStatus => _reservationStatus;

  void updateReservationStatus(ReservationStatus status) => _reservationStatus = status;
}

class Customer {
  final String firstName;
  final String lastName;
  final List<Order> orders = [];
  final List<TableReservation> reservations = [];

  Customer({required this.firstName, required this.lastName});

  void placeOrder(Order order) => orders.add(order);
  void reserveTable(TableReservation reservation) => reservations.add(reservation);

  void displayInfo() {
    print("\nCustomer: $firstName $lastName");

    print("Reservations:");
    for (var reservation in reservations) {
      print("Table ${reservation.tableNum}, Date = ${reservation.reservationDate}, Status = ${reservation.reservationStatus.name}");
    }

    for (var order in orders) {
       for (var item in order.items) {
        print("Item Order: ${item.name}, Category: ${item.category.name}");
      }
      print("Total = \$${order.totalPrice}, Status = ${order.orderStatus.name}, Payment = ${order.paymentStatus.name}");
    }
  }
}

void main() {
  // customer
  var customer1 = Customer(firstName: "Socheat", lastName: "Khoeun");
  var customer2 = Customer(firstName: "Bunheng", lastName: "Doeun");
  // reservation
  customer1.reserveTable(TableReservation(tableNum: 5, reservationDate: DateTime.now()));
  customer2.reserveTable(TableReservation(tableNum: 6, reservationDate: DateTime.now()));

  // add items to the menu
  var menuManager = MenuManager();
  var item1 = Menu(name: "Pizza", price: 10.0, category: MenuCategory.Food);
  var item2 = Menu(name: "Soda", price: 2.0, category: MenuCategory.Drink);
  var item3 = Menu(name: "Ice-Cream", price: 8.0, category: MenuCategory.Dessert);
  menuManager.addItem(item1);
  menuManager.addItem(item2);
  menuManager.addItem(item3);

  // order
  var order1 = Order();
  var order2 = Order();
  order1.addItem(item1);
  order2.addItem(item2);
  customer1.placeOrder(order1);
  customer2.placeOrder(order2);

  // Display the menu
  print("Menu:");
  menuManager.displayMenu();

  // Customer 1 pays for their order
  order1.updatePaymentStatus(PaymentStatus.Paid);

  // Display customer orders and reservations
  customer1.displayInfo();
  customer2.displayInfo();
}
