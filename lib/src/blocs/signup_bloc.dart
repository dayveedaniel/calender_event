import 'dart:async';
import '../mixins/validation_mixins.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();


  // add data to the stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<String> get confirmPassword =>
      _confirmPasswordController.stream.transform(validateConfirmPassword).doOnData((String c ){
        if (0 != _passwordController.value.compareTo(c)) {
          _confirmPasswordController.addError('Not a match');
        }
      });

  Stream<bool> get submitValid =>
      Rx.combineLatest3(
          email, password, confirmPassword, (e, p, c) => (0 == p.compareTo(c)));

  //change data
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  Function(String) get changeConfirmPassword =>
      _confirmPasswordController.sink.add;

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
  }

  // close sink
  dispose() {
    _passwordController.close();
    _emailController.close();
    _confirmPasswordController.close();
  }

}
