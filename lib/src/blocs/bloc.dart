import 'dart:async';
import '../mixins/validation_mixins.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // add data to the stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  //change data
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  submit() {
    final validEmail =_emailController.value;
    final validPassword =_passwordController.value;
  }

  // close sink
  dispose() {
    _passwordController.close();
    _emailController.close();
  }
}

final bloc = Bloc();
