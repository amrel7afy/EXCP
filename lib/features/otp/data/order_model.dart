class Order {
  final String orderName;
  final String orderDate;
  final String orderNationality;
  final String orderJob;
  final String orderDetails;

  Order(
      {required this.orderName,
      required this.orderDate,
      required this.orderNationality,
      required this.orderJob,
      required this.orderDetails});
}

List<Order> personOrders = [
  Order(
      orderName: 'Amr Elhafy',
      orderDate: '20/03/2022',
      orderNationality: 'مصري',
      orderJob: 'عاملة منزل',
      orderDetails: 'طلب اختيار افراد التطبيق'),
  Order(
      orderName: 'Ahmed Abo Alfadl',
      orderDate: '20/03/2021',
      orderNationality: 'مصري',
      orderJob: 'عاملة منزل',
      orderDetails: 'طلب اختيار افراد التطبيق'),
  Order(
      orderName: 'Amr Elhafy',
      orderDate: '20/03/2024',
      orderNationality: 'مصري',
      orderJob: 'عاملة منزل',
      orderDetails: 'طلب اختيار افراد التطبيق'),
  Order(
      orderName: 'Ahmed Abo Alfadl',
      orderDate: '20/03/2021',
      orderNationality: 'مصري',
      orderJob: 'عاملة منزل',
      orderDetails: 'طلب اختيار افراد التطبيق'),
];
List<Order> hoursOrders = [
  Order(
      orderName: 'Amr Elhafy',
      orderDate: '20/03/2024',
      orderNationality: 'مصري',
      orderJob: 'عاملة منزل',
      orderDetails: 'طلب اختيار افراد التطبيق'),
  Order(
      orderName: 'Amr Elhafy',
      orderDate: '20/03/2024',
      orderNationality: 'مصري',
      orderJob: 'عاملة منزل',
      orderDetails: 'طلب اختيار افراد التطبيق'),
  Order(
      orderName: 'Ahmed Abo Alfadl',
      orderDate: '20/03/2021',
      orderNationality: 'مصري',
      orderJob: 'عاملة منزل',
      orderDetails: 'طلب اختيار افراد التطبيق'),
];
List<Order> businessOrders = [
  Order(
      orderName: 'Amr Elhafy',
      orderDate: '20/03/2024',
      orderNationality: 'مصري',
      orderJob: 'عاملة منزل',
      orderDetails: 'طلب اختيار افراد التطبيق'),
  Order(
      orderName: 'Ahmed Abo Alfadl',
      orderDate: '20/03/2021',
      orderNationality: 'مصري',
      orderJob: 'عاملة منزل',
      orderDetails: 'طلب اختيار افراد التطبيق'),
];
