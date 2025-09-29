enum NavigationRoute {
  homeRoute('/'),
  profileRoute('/profile'),
  aboutRoute('/about'),
  settingsRoute('/settings');

  const NavigationRoute(
    this.name
  );

  final String name;
}