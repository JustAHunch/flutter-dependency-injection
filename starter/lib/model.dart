enum CounterMode {
  plus,
  minus;

  CounterMode trans() {
    switch (this) {
      case CounterMode.plus:
        return CounterMode.minus;
      case CounterMode.minus:
        return CounterMode.plus;
    }
  }
}

// 1. 의존성 등록을 위해 카운터와 관련된 모든 프로퍼티를 각각의 모델로 변환
class CounterModel {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
  }

  void decrement() {
    _counter--;
  }
}

class CounterModeModel {
  CounterMode _counterMode = CounterMode.plus;

  CounterMode get counterMode => _counterMode;

  void toggleMode() {
    _counterMode = _counterMode.trans();
  }
}
