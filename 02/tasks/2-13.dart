/// 建立一個Cat類別，裡面有字串型別的variety (品種屬性)， 數字型別的weight（重量屬性），一個echo函數，使用時會印出喵。
class Cat {
    //屬性
    String variety;
    int weight;

    // 建構子
    Cat(this.variety, this.weight);
    
    // 使用時會印出喵
    void echo() {
        print("喵");
    }

}
 
/// 建立一個Dog類別，裡面有字串型別的variety (品種屬性)， 數字型別的weight（重量屬性），一個echo函數，使用時會印出汪。
class Dog {
    // 屬性
    String variety;
    int weight;

    // 建構子
    Dog(this.variety, this.weight);

    //使用時會印出汪
    void echo() {
        print("汪");
    }
}
 
/// 建立一個Human類別，裡面有字串型別的variety (品種屬性)， 數字型別的weight（重量屬性），一個echo函數，使用時會印出雲育鏈。
class Human {
    // 屬性
    String variety;
    int weight;
    
    // 建構子
    Human(this.variety, this.weight);

    // 使用時會印出雲育鏈
    void echo() {
        print("雲育鏈");
    }
}
 
/// 建立一個Rabbit類別，裡面有字串型別的variety (品種屬性)， 數字型別的weight（重量屬性），一個echo函數，使用時會印出咕咕；一個score函數，評鑑weight重量屬性，超過20時，傳回文字胖，低於或等於20時，傳回文字普通。
class Rabbit {
    // 屬性
    String variety;
    int weight;

    // 建構子
    Alien(this.variety, this.weight);

    // 使用時會印出汪
    void echo() {
        print("咕咕");
    }

    // score函數，評鑑weight重量屬性，超過20時，傳回文字胖，低於或等於20時，傳回文字普通。
    void score() {
        if (weight > 20) {
        print("胖");
        } else {
        print("普通");
        }
    }
}

void main() {
    // cat
    Cat cat = Cat("美國短毛貓", 17);
    print(cat.variety);
    print(cat.weight);
    cat.echo();

    // dog
    Dog dog = Dog("黃金獵犬", 36);
    print(dog.variety);
    print(dog.weight);
    dog.echo();

    // human
    Human human = Human("智人", 70);
    print(human.variety);
    print(human.weight);
    human.echo();

    // alien
    Alien rabbit = Rabbit("白兔", 22);
    print(rabbit.variety);
    print(rabbit.weight);
    rabbit.echo();
    rabbit.score();
}
