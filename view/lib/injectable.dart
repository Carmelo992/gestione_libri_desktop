import 'package:flutter/material.dart';

class Injectable {
  final T Function<T extends Object>({String? instanceName}) inject;

  const Injectable(this.inject);
}

abstract class InjectableStateful extends StatefulWidget {
  final T Function<T extends Object>({String? instanceName}) inject;

  const InjectableStateful(this.inject, {super.key});
}

abstract class InjectableStateless extends StatelessWidget {
  final T Function<T extends Object>({String? instanceName}) inject;

  const InjectableStateless(this.inject, {super.key});
}
