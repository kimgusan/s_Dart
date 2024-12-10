# dart

-   JIT: just in time compiler / AOT : ahead of time compiler
-   null safety

-   main() : 서비스를 실행 시킬 수 있는 함수라고 간단하게 인지하고 있을 것.
-   ; 중요 (cascade operator)

## 변수 (Variables)

-   var : 함수나 메소드 내부에 지역변수를 사용할때 사용 (지역변수)
-   String/int/bool/num/double 등 같이 타입을 명시해도 됌

    >

        void main() {
            // String name = '규산';
            var name =  '규산';
            name = 'kyusan';
            print(name);
            }

-   dynamic : 변수가 어느 타입으로 작성될 지 모를 때 사용 (단, var 형태로 써도 된다.) / 정말 필요할 때 사용

    >

        void main() {
            dynamic name;
            // var name;
            if(name is String){
                name.  (어떠한 형태를 확인할 수 있다)
            }
            if(name is int){
                name.  (어떠한 형태를 확인할 수 있다)
            }
        }

-   null safety : 변수 타입 뒤에 '?' 를 붙여주게 되면 null 이나 어떠한 변수가 나온다는 것을 확인할 수 있다.

    >

        void main() {
            String? nico = 'nico';
            nico = null;
            if (nico != null) {
                nico.isNotEmpty;
            }
            // nico?.isNotEmpty;
        }

-   final: 한번반 선언할 수 있는 변수 (js 에서 const 랑 유사) // Final Variables

    >

        void main() {
            final name = 'nico';
            // final String name = 'nico'
            }

-   late : 초기 내용 없이 변수를 선언할 수 있게 해준다 (Late Variables)

    >

        void main() {
            late final String name;
            // do somthing, go to api
            name = nico''
        }

-   const: compile-time constant (Constant Variables)  
    tip. const/ final 의 차이는 런타임 도중 변수를 만들 수 있다는 것이고, const 는 런타임 전에 변수를 만들어놔야한다.
    >
        void main() {
            const name = "tom"; // 컴파일 시점에 바뀌지 않는 값
            final username=fetchAPI(); // 컴파일 시점에 바뀌는 값
        }

## 데이터 타입 (Data Type)

-   var, String, num, int, double, bool 등등 이 있음
    >
        num 의 경우 숫자가 소수점일지 정수일지 알지 못할때 사용.

### Lists (python의 list 같은 부분)

    void main() {
        // List<int> numbers = [1, 2, 3, 4];
        var numbers = [1, 2, 3, 4];
            numbers.add(1);
        }

-   numbers.first; : 첫번째 요소
-   numbers.last; : 마지막 요소

### - collection if, collection for 를 사용할 수 있다.

>

    # collection if
    void main() {
        var giveMeFive = true;
        var numbers = [1, 2, 3, 4, if (giveMeFive) 5];
    }
    위의 내용은
    if (giveMeFive){
        numbers.add(5)
    }
    와 같은 내용을 의미한다.

>

    # collection for
    void main() {
        var oldFriends = ['nico', 'lynn'];
        var newFriends = [
            'lewis',
            'ralph',
            'darren',
            for (var friend in oldFriends) "$friend"
        ];

        원래 위에 사용된 코드는
        for (var friend in oldFriends){
            newFriends.add()
        }
        위와 같은 내용을 의미한다.
    }

### String Interpolation: 텍스트에 변수를 추가하는 방법.

-   변수 명 앞에 $ 를 붙여서 사용한다.  
    (var greeting = "Hello everyone , my name is $name, nice to meey you";)  
    (var greeting = "Hello everyone , my name is $name and my name is ${age + 2}";)

### Maps (python의 dictionary 같은 부분)

>

    # 명시적으로 정의한 자료형
    var player = {'name': 'nico', 'xp': 19.99, 'superpower': false};

    # 상세하게 만들어지는 자료형
    Map<List<int>, bool> player = {
        [1, 2, 3, 4]: true
    };

    List<Map<String, Object>> players = [
        {'name': 'nico', 'xp': 19.9993},
        {'name': 'nico', 'xp': 19.9993}
    ]
    # 빈 자료형 만들기
    Map<int, bool> player = {1: true, 2: false, 3: true};

### Set (python의 set 같은 부분)

>

    var numbers = {1, 2, 3, 4}

    Set<int> numbers = {1, 2, 3, 4}

## Function

-   void 는 return 하지 않고 실행되는 함수

>

    # personal Parameters : 파리미터 순서 중요
    String sayHello(String potato) {
        return "Helllo $potato nice to meet you";
    }

    # far arrow syntax: 중괄호랑 reuturn 을 생략 후 화살표 함수로 표현
    # 복잡한 함수가 아닌 한줄짜리 함수일 경우 사용
    String sayHello(String potato) => "Helllo $potato nice to meet you";
    num plus(num a, num b) => a + b;

    void main() {
        print(sayHello('nico'));
    }

### Named Parameters

>

    String sayHello(
        {required String name, int? age, String country = 'korea'}) {
        return "Hello $name, you are $age, and you came from $country";
    }

    void main() {
        print(sayHello(name: 'nico', age: 12));
    }

### Optional Positional Parameters

>

    String sayHello(String name, int age, [String? country = 'cuda']) =>
        'Hello $name, you are $age years old from $country';

    void main() {
        var result = sayHello('nico', 12);
        print(result);
    }

### QQ Operator

-   ?? 연산자를 이용하면 왼쪽 값이 null인지 체크해서 null이 아니면 왼쪽 값을 리턴하고 null이면 오른쪽 값을 리턴한다.

>

    =====================================================================
    1) String capitalizeName(String? name){
        if (name != null){
            return name.toUpperCase();
        }
        return 'ANON';
    }

    2) String capitalizeName(String? name) => name != null ? name.toUpperCase() : 'ANON';


    3) String capitalizeName(String? name) => name?.toUpperCase() ?? 'ANON';
    =====================================================================
    void main() {
    capitalizeName('nico');
    capitalizeName(null);
    }

>

    void main() {
        String? name;
        name ??= 'nico';
        name ??= 'another';
        print(name);
    }

### TypeDef

-   자료형에 사용자가 원하는 alias 를 붙이게 해준다.  
    (자료형의 이름의 별명을 만들 때 사용)

>

    typedef ListOfInts = List<int>;

    ListOfInts reverseListOfNumbers(ListOfInts list) {
    var reversed = list.reversed;
        return reversed.toList();
    }

    void main() {
        print(reverseListOfNumbers([1, 2, 3]));
    }

    typedef UserInfo = Map<String, String>;

    ====================================================
    String sayHi(UserInfo userInfo) {
        return "hi ${userInfo['name']}";
    }

## Class

-   class 를 생성할 때는 타입을 명시해야한다.

>

    class Player {
        final String name = 'nico';
        final int age = 17;
        void sayName(){
        // class method안에서는 this를 쓰지 않는 것을 권장한다.
        // 단, 클래스 내부에서 함수 내부에서 var name 같은 지역 변수를 사용하려고 할 때는 ${this.name} 으로 작성해야한다.
            print("Hi my name is $name")
        }
        }

        void main(){
            // new를 꼭 붙이지 않아도 된다.
            var player =Player();
        }

### Constructors : 생성자

>

    class Player {
        ==================================
        final String name;
        int xp;

        Player(this.name, this.xp);
        ==================================
        위와 같은 코드를 길게 풀어 써놓은 형태
        late final String name;
        late int xp;

        Player(String name, int xp) {
            this.name = name;
            this.xp = xp;
        }

        ==================================

        void sayHello() {
            print("Hi my name is $name");
        }
    }

    void main() {
        var player = Player('kyusan', 1500);
        player.sayHello();
        var player2 = Player('tate', 3000);
        player2.sayHello();
    }

#### Named Constructor

>

    class Player {
        final String name;
        int xp;
        String team;
        int age;

        Player(
            {required this.name,
            required this.xp,
            required this.team,
            required this.age});

        void sayHello() {
            print("Hi my name is $name xp is $xp team is $team age is$age");
        }
        }

        void main() {
        var player = Player(name: 'kyusan', xp: 1500, team: 'red', age: 13);
        player.sayHello();
        var player2 = Player(name: 'tate', xp: 3000, team: 'blue', age: 4);
        player2.sayHello();
        }

=============================================

Named Constructor에서도 syntactic sugar(편의 문법)이 존재합니다.

```
✅ Named parameters
// 일반적인 방법
Player.createBlue({
required String name,
required int xp
}) : this.name = name,
this.xp = xp,
this.team = 'blue';

// 간소화된 방법(dart는 간소화된 방법을 추천)
Player.createRed({
required this.name,
required this.xp,
this.team = 'red',
});

✅ positional parameters
// 일반적인 방법
Player.createRed(String name, int xp)
: this.name = name,
this.xp = xp,
this.team = 'red';

// 간소화된 방법
Player.createRed(
this.name,
this.xp,
[this.team = 'red']
);

🔗 https://dart-lang.github.io/linter/lints/prefer_initializing_formals
```

```
# api 데이터를 가져왔을 때 생성자를 이용하는 방법

class Player {
  final String name;
  int xp;
  String team;

  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'];

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var apiData = [
    {"name": "kyu", "team": "red", "xp": 0},
    {"name": "teate", "team": "blue", "xp": 100},
    {"name": "upass", "team": "skyblue", "xp": 200}
  ];

  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}

```

#### Cascade Notation

-   아래의 '..' 들은 playerInfo 라는 생성된 객체를 가리킨다. 매우 유용한 operator 이다.
-   앞에 class 가 있다면 그 클래스를 가리킨다.

```dart
// 생략
void main(){
var playerInfo = Player(name: "nico", age: 17, description: "Happy code is end coding");
    playerInfo.name = "nico";
    playerInfo = 20;
    playerInfo.description = "Best Project is End Project";
}
```

위를 보면 반복되는 부분이 있다. dart에서는 이걸 간단하게 ..으로 해결할 수 있다.

```dart
// 생략
void main(){
var playerInfo = Player(name: "nico", age: 17, description: "Happy code is end coding");
    ...name = "nico"
    ..age = 20
    ..description = "Best Project is End Project";
}
```

#### Enums

-   enum은 우리가 실수하지 않도록 도와주는 타입이다.
-   dart에서 enum type을 만드는 법은 다음과 같다

```dart
enum Team {
red,
blue,
}
class Player {
    String name;
    int age;
    Team team;

    Player({
        required this.name,
        required this.age,
        required this.team,
    });
}

void main(){
var playerInfo = Player(name: "nico", age: 17, team: Team.red);
var popat = playerInfo
    ..name = "popat"
    ..age = 12
    ..team = Team.blue;
}
```

#### Abstract Classes (추상화 메소드 / 클래스)

추상화 클래스는 다른 클래스들이 직접 구현 해야하는 메소드들을 모아놓은 일종의 `청사진`이라 보면 된다.
추상 클래스에서는 기능을 구현하지 않는다.

```dart
abstract class Human {
    void walk();
}
```

extends를 이용해 상속, 확장을 할 수 있다.

```dart
abstract class Human {
void walk();
}
class Player extends Human {
// 생략
    void walk(){
    print("working!");
    }
}
```

#### Inheritance (상속)

상속을 하고 super를 이용해 부모 클래스의 생성자를 호출할 수 있다.

```dart
class Human {
    final String name;
    Human(this.name); // 호출 받는다.
    void sayHello(){
        print("Hello! $name");
    }
}

class Player extends Human {
Player({
    required this.team,
    required String name
}) : super(name: name);
// Human의 생성자 함수를 호출한다.
}
```

@override를 이용해 부모 클래스의 객체를 받아올 수 있다.

```dart
// 생략
@override
    void sayHello(){
    super.sayHello();
}
```

### Mixins : 생성자가 없는 클래스

-   Mixin은 생성자가 없는 클래스를 의미한다.
    Mixin 클래스는 상속을 할 때 extends를 하지 않고 with 를 사용한다.
    Mixin의 핵심은 여러 클래스에 재사용이 가능하다는 점이다.

```dart
mixin class Tall {
    final double tall = "190.00"
}

class Human with Tail {
// 생략
}
```

-   extends와 차이점은 extend를 하게 되면 확장한 그 클래스는 부모 클래스가 되지만 with는 부모의 인스턴스 관계가 된다. 단순하게 mixin 내부의 프로퍼티를 갖고 오는 거라고 생각하면 쉽다.
