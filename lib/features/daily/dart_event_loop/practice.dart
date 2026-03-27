import "dart:async";

void main() {
  exampleOne();
}


void exampleOne() {
  print('1');

  scheduleMicrotask(() => print('2'));
  Future(() => print('3'));
  Future.delayed(Duration.zero, () => print('4'));
  Future(() async {
    print('5');
    await Future.delayed(Duration.zero);
    print('6');
  });
  scheduleMicrotask(() => print('7'));

  print('8');

  // Let’s break it down:
  // print('1'): sync -> Immediately
  // scheduleMicrotask(...): Microtask -> After sync
  // Future(...): Event queue -> Later
  // Future.delayed: Event queue -> Later
  // await Future.delayed(...): Event queue → Suspends, resumes as microtask
  // print('8'): Sync -> Immediately
  // So, microtasks always run before event queue tasks and that causes most unexpected behavior in Flutter apps.
}