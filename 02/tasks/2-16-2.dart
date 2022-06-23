/// 定義一個Human抽象類別，有一個字串基礎屬性為姓名，另外有一個未實踐的echo函數。另外設置一個Asian類別，繼承Human類別，調度echo函數時，必須印出 「你好」; 另外設置一個European類別，繼承Human類別，調度echo函數時，必須印出 「Hello」。
abstract class Human {
    // 基礎屬性
    String name;
    // 建構子
    Human(this.name);
    // 方法
    void echo();
}

class Asian extends Human {
    // 建構子
    Asian(String name) : super(name);
    // 實作 echo
    @override
    void echo() {
        print("你好");
    }
}

class European extends Human {
    // 建構子
    European(String name) : super(name);
    // 實作 echo
    @override
    void echo() {
        print("Hello");
    }
}

void main() {
    // 亞洲人
    Human xiaoMin = Asian("小明");
    print(xiaoMin.name);
    xiaoMin.echo();

    // 歐洲人
    Human tom = European("Tom");
    print(tom.name);
    tom.echo();
}
