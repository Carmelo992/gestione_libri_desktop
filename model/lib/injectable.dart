class Injectable {
  final T Function<T extends Object>({String? instanceName}) inject;

  const Injectable(this.inject);
}
