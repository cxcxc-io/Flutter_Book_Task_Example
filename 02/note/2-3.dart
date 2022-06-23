void main() {

    // peopleAmount 這個變數為51，代表有51個人
    int peopleAmount = 51;

    // 如果超過50人，則印出 我願意
    if (peopleAmount > 50) {
        print("我願意");
    // 不然，印出去吃吃到飽
    } else {
        print("去吃吃到飽");
    }

    /// 結婚基金的故事
    /// 
    /// 愛情需要一點麵包，
    ///   如果存超過一萬元的話，就去公證結婚
    ///   如果剛好一萬元的話，雖然有點勉強，但也還可以
    ///   若小於一萬元，只能婉拒了。
    int budget = 30000;
    if (budget > 10000) {
        print("我們現在就去公證結婚");
    } else if (budget == 10000) {
        print("雖然有點勉強，但還可以");
    } else {
        print("我爸媽說，你還年輕，還可以多衝幾年事業。");
    }

    /// 我心裡只有小菜，
    ///   如果不是小菜的話，我終身不嫁
    ///   如果是小菜的話，我就要嫁出去了。
    String yourName = "小菜";
    if (yourName != "小菜") {
        print("我終身不嫁");
    } else {
        print("我要嫁了");
    }

}
