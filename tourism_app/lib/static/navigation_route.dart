enum NavigationRoute {
  homeRoute('/', 'home'),
  detailRoute('/detail', 'detail'),
  testRoute('/test', 'test');

  const NavigationRoute(
    this.name,
    this.description
  );

  final String name;
  final String description;
}