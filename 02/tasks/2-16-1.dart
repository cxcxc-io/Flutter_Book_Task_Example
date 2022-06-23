/// 定義一個Animal抽象類別，有一個字串基礎屬性為姓名，另外有一個未實踐的echo函數。另外設置一個Dog類別，繼承Animal類別，調度echo函數時，必須印出 「汪」; 另外設置一個Cat類別，繼承Animal類別，調度echo函數時，必須印出 「喵」。
abstract class Animal {
    // 基礎屬性
    String name;
    // 建構子
    Animal(this.name);
    // 方法
    void echo();
}

class Dog extends Animal {
    // 建構子
    Dog(String name) : super(name);
    // 實作 echo
    @override
    void echo() {
        print("汪");
    }
}

class Cat extends Animal {
    // 建構子
    Cat(String name) : super(name);
    // 實作 echo
    @override
    void echo() {
        print("喵");
    }
}

void main() {
    // 狗
    Animal husky = Dog("哈士奇");
    print(husky.name);
    husky.echo();

    // 貓
    Animal garfield = Cat("加菲貓");
    print(garfield.name);
    garfield.echo();
}
