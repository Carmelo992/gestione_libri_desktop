class Injectable {
  final T Function<T extends Object>() inject;

  const Injectable(this.inject);
}
