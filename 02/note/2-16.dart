/// abstract class
///
/// 飲料[Drinking]是一種抽象的概念，我們用 abstract class 進行表達
/// 並為飲料規範出了幾種必須屬性：產地[origin]、品牌[branding]、價格[price]
/// 並設定了人類世界所需要知道的方法流程、飲用指示[drinkingInstruction()]、須知[mustKnow()]
abstract class Drinking {
    // 定義基本屬性，留到核心建構子，進行定義
    String origin;
    String branding;
    int price;

    // 核心建構子
    Drinking(this.origin, this.branding, this.price);

    // 定義了一個每種飲料的共同須知函數，並編寫內容在裡面
    void mustKnow() {
        print("產品若有瑕疵，可聯絡消基會");
    }

    // 定義了飲用指示，但未編寫內容
    void drinkingInstruction();
}

/// Coffee
///
/// 咖啡[Coffee]屬於飲料[Drinking]的一種，能有具體的產品
/// 於是我們以 class 設置了咖啡，並讓其繼承[Drinking]類別
/// 一旦繼承了抽象類別，就必須要實踐那些抽象類別沒有完成編寫的函數
class Coffee extends Drinking {
    // 咖啡類別的建構子，用戶輸入之後，完成 Coffee 類別的物件建置
    // 並將該些內容交付給父類別的建構子
    Coffee(String origin, String branding, int price)
        : super(origin, branding, price);

    // 由於 Drinking 抽象類別在此，沒有編寫函數
    // 在此完成編寫，並加上 @override，告知 Dart 覆蓋父類的同名函數
    @override
    void drinkingInstruction() {
        print("建議半夜十二點以後，不要喝咖啡，避免無法入睡");
    }
}

/// Tea
///
/// 茶[Tea]屬於飲料[Drinking]的一種，能有具體的產品
/// 於是我們以 class 設置了茶，並讓其繼承 Drinking 類別
/// 一旦繼承了抽象類別，就必須要實踐那些抽象類別還沒有完成編寫的函數
/// 在此，為了讓大家知道，即便是父類別已經設定好的函數，依舊可以重新覆蓋
/// 故覆蓋了 mustKnow 方法，換了新內容
class Tea extends Drinking {
    // 茶類別的建構子，用戶輸入之後，完成 Coffee 類別的物件建置
    // 並將該些內容交付給父類別的建構子
    Tea(String origin, String branding, int price)
        : super(origin, branding, price);

    // 由於 Drinking 抽象類別在此，沒有編寫函數
    // 在此完成編寫，並加上 @override，吿知 Dart 覆蓋父類的同名函數
    @override
    void drinkingInstruction() {
        print("可熱沖或冷泡");
    }

    // 除了父類沒有編寫內容的函數，可以重新編寫。有編寫的內容，也可以重新編寫。
    @override
    void mustKnow() {
        print("喝好茶，可醒神延年益壽");
    }
}

void main() {
    /// 雲育鏈咖啡
    ///
    /// 我們建立一個雲育鏈咖啡[cxcxcCoffee]，輸入產地、品牌與價格
    /// 印出品牌，確認成功建立
    /// 調度飲用指示，確認是不是剛剛我們編寫的內容
    /// 調度須知，確認是父類的內容
    Drinking cxcxcCoffee = Coffee("中壢", "雲育鏈", 20);
    print(cxcxcCoffee.branding);
    cxcxcCoffee.drinkingInstruction();
    cxcxcCoffee.mustKnow();

    /// 烏龍茶
    ///
    /// 我們建立一個烏龍茶[wulongTea]，輸入產地、品牌與價格
    /// 印出品牌，確認成功建立
    /// 調度飲用指示，確認是不是剛剛我們編寫的內容
    /// 調度須知，確認是父類的內容
    Drinking wulongTea = Tea("南投", "回甘", 700);
    print(wulongTea.branding);
    wulongTea.drinkingInstruction();
    wulongTea.mustKnow();
}
