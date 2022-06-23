import "dart:convert";

/// 建立一個Cat類別，裡面有字串型別的variety (品種屬性)， 數字型別的weight（重量屬性），一個echo函數，使用時會印出喵。並設計一個第二建構子fromJson()，能接收dynamic的json資料去生成Cat物件，並設計一個 toJson()，能將Cat物件，轉換回 String型別的json資料。
class Cat {
    // 屬性
    String variety;
    int weight;

    // 建構子
    Cat(this.variety, this.weight);

    // 使用時會印出喵
    void echo() {
        print("喵");
    }

    // 第二建構子
    factory Cat.fromJson(dynamic catJson) {
        String catVariety = catJson["variety"];
        int catWeight = catJson["weight"];
        return Cat(catVariety, catWeight);
    }
    // toJSon 方法，將 Cat 物件，轉換回 String 類型的 json 資料
    String toJson() {
        dynamic catJson = {"variety": variety, "weight": weight};
        return jsonEncode(catJson);
    }
}

/// 建立一個Dog類別，裡面有字串型別的variety (品種屬性)， 數字型別的weight（重量屬性），一個echo函數，使用時會印出汪。並設計一個第二建構子fromJson()，能接收dynamic的json資料去生成Dog物件，並設計一個 toJson()，能將Dog物件，轉換回 String型別的json資料。
class Dog {
    // 屬性
    String variety;
    int weight;

    // 建構子
    Dog(this.variety, this.weight);

    // 使用時會印出汪
    void echo() {
        print("汪");
    }

    // 第二建構子
    factory Dog.fromJson(dynamic dogJson) {
        String dogVariety = dogJson["variety"];
        int dogWeight = dogJson["weight"];
        return Dog(dogVariety, dogWeight);
    }
    // toJSon 方法，將 Dog 物件，轉換回 String 類型的 json 資料
    String toJson() {
        dynamic dogJson = {"variety": variety, "weight": weight};
        return jsonEncode(dogJson);
    }
}

/// 建立一個Human類別，裡面有字串型別的variety (品種屬性)， 數字型別的weight（重量屬性），一個echo函數，使用時會印出雲育鏈。並設計一個第二建構子fromJson()，能接收dynamic的json資料去生成Human物件，並設計一個toJson()，能將Human物件，轉換回 String型別的json資料。
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

    // 第二建構子
    factory Human.fromJson(dynamic humanJson) {
        String humanVariety = humanJson["variety"];
        int humanWeight = humanJson["weight"];
        return Human(humanVariety, humanWeight);
    }
    // toJSon 方法，將 Human 物件，轉換回 String 類型的 json 資料
    String toJson() {
        dynamic humanJson = {"variety": variety, "weight": weight};
        return jsonEncode(humanJson);
    }
}

void main() {
    // cat
    Cat demoCat = Cat("藍貓", 18);

    print(demoCat.variety);
    print(demoCat.weight);
    demoCat.echo();

    String catJsonString = demoCat.toJson();
    print(catJsonString);

    dynamic catFromJson = jsonDecode(catJsonString);
    Cat catfromJsonString = Cat.fromJson(catFromJson);
    print(catfromJsonString.variety);
    print(catfromJsonString.weight);

    // dog
    Dog demoDog = Dog("哈士奇", 35);

    print(demoDog.variety);
    print(demoDog.weight);
    demoDog.echo();

    String dogJsonString = demoDog.toJson();
    print(dogJsonString);

    dynamic dogFromJson = jsonDecode(dogJsonString);
    Dog dogfromJsonString = Dog.fromJson(dogFromJson);
    print(dogfromJsonString.variety);
    print(dogfromJsonString.weight);

    // human
    Human demoHuman = Human("變種人", 70);

    print(demoHuman.variety);
    print(demoHuman.weight);
    demoHuman.echo();

    String humanJsonString = demoHuman.toJson();
    print(humanJsonString);

    dynamic humanFromJson = jsonDecode(humanJsonString);
    Human humanfromJsonString = Human.fromJson(humanFromJson);
    print(humanfromJsonString.variety);
    print(humanfromJsonString.weight);
}
