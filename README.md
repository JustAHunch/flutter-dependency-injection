# 의존성 주입

## 라이브러리

> get_it 이론
>
- 서비스 로케이터(Service Locator)
    - 동작 원리
        - 싱글톤으로 관리 → 모든 의존성이 한 곳에서 관리
        - 등록(Register)
            - 사용할 서비스(객체)를 등록, 각 서비스는 고유한 식별자 보유
        - 검색(Get)
            - 고유한 식별자로 특정 서비스(객체)의 인스턴스 검색
    - 장점
        - 런타임에 의존성 교체가 쉬워서 테스트 환경에 유용
        - 의존성을 검색하는 코드를 간결하게 작성 가
    - 단점
        - 클래스간의 의존성이 명시적이지 않아서 코드 가독성과 명확성 저하
        - 전역 상태로 여러 부분에서 공유되는 상태가 만들어질 수 있어서 상태 변화의 예측이 어려운 부작용 발생 가능성이 있음
        - 테스트 코드 작성시 Mock 객체로 대체하기 어려움
          - 예제

              ```dart
              // ServiceLocator 예시
              class ServiceLocator {
                  static final Map<Type, dynamic> _services = {};
                  static void register<T>(dynamic service) {
                      _services[T] = service;
                  }
        	
                  static T get<T>() {
                      return _services[T];
                  }
              }
        
              // 예시
              // 서비스 로케이터에 도끼를 생성하여 등록
              ServiceLocator.register<Axe>(Axe());
        
              // 모험가 생성시 서비스 로케이터에 등록된 도끼를 장착
              final Adventurer adventurer = Adventurer(ServiceLocator.get<Axe>());
              adventurer.attack(); // 공격
              ```

              ```dart
              // GetIt 예제
              // GetIt 을 사용하면 ServiceLocator 패턴을 쉽게 적용할 수 있음
        
              // 1. GetIt 인스턴스 초기화
              GetIt locator = GetIt.instance;
        
              // 2. 의존성 등록을 위해 카운터와 관련된 모든 프로퍼티를 각각의 모델로 변환
              class CounterModel
              class CounterModeModel
              // 3. 모델 의존성 등록
              locator.registerSingleton<CounterModel>(CounterModel());
              locator.registerSingleton<CounterModeModel>(CounterModeModel());
        
              // 4. 의존성 주입
              final Adventurer adventurer = Adventurer(locator<Axe>());
        
              // 5. get으로 주입받은 모델을 불러와서 사용
              locator.get<CounterModel>().counter
              locator.get<CounterModeModel>().counterMode.icon
              locator.get<CounterModeModel>().toggleMode()
              locator.get<CounterModeModel>().counterMode
              locator.get<CounterModel>().increment()
              locator.get<CounterModel>().decrement()
              ```
