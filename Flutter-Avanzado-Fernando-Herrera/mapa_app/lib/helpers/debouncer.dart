
import 'dart:async';
// Creditos
// https://stackoverflow.com/a/52922130/7834829

// final debouncer = Debouncer<String>(duration: Duration(milliseconds: 500 ));

class Debouncer<T> {

  Debouncer({ this.duration, this.onValue });

  final Duration duration;
  void Function(T value) onValue;
  T _value;
  Timer _timer;
  
  T get value => _value;

  set value(T val) {
    _value = val;
    _timer?.cancel();
    _timer = Timer(duration, () => onValue(_value));
  }  
}