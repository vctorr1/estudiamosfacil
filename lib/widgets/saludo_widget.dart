String getGreeting() {
  var hour = DateTime.now().hour;

  if (hour >= 0 && hour < 12) {
    return 'Buenos días,';
  } else if (hour >= 12 && hour < 17) {
    return 'Buenas tardes,';
  } else {
    return 'Buenas noches,';
  }
}
