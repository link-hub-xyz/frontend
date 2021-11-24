import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

abstract class Service<S> {
  Future<void> bootstrup(Store<S> store);
}

class CompositeService<S> implements Service<S> {
  final List<Service> _services;

  factory CompositeService(List<Service> services) =>
      CompositeService._(services);

  CompositeService._(this._services);

  @override
  Future<void> bootstrup(Store store) async {
    print('___');
    print('Booting up service layer:');
    await Future.forEach(_services, (dynamic service) async {
      final name = service.runtimeType;
      print('Bootstrup: $name');
      await service.bootstrup(store);
      print('Bootstrup Done: $name');
    });
    print('___');
    return;
  }
}

@immutable
class ServiceBuilder<S> {
  final List<Service<S>> _services = [];

  ServiceBuilder();

  void service(Service<S> service) {
    _services.add(service);
  }

  Service<S> build() => CompositeService<S>(_services);
}
