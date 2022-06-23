/// 使用 async
///
/// 在宣告方法後面加上 async
/// 讓 Dart 知道這個方法要透過 await，把語法變得像以前沒有使用 Future 與 then 串接那樣
/// 一樣可以使用以往的 try catch, if else 等等
void xiaoMeiSchedule() async {
    /// 範例
    ///
    /// 小美的行程
    /// 這裡發起一個 Future，讓 Dart 將這個任務進行異步分工
    /// 透過 await 語法，要求必須等這個 Future 執行完，取回結果之後，才能往下執行
    String lastTask = await Future.microtask(() {
        return "小美吃中餐";
    });

    // 當 lastTask 是小美吃中餐，則開始下個動作，並將 lastTask 改為小美訂高鐵票
    if (lastTask == "小美吃中餐") {
        print(lastTask);
        lastTask = "小美訂高鐵票";
    }

    // 當 lastTask 是小美訂高鐵票，則開始下個動作，並將 lastTask 改為小美訂高鐵票
    if (lastTask == "小美訂高鐵票") {
        print(lastTask);
        lastTask = "小美搭車去高鐵";
    }
    
    // 印出最終結果
    print(lastTask);
}

void main() {
    // 會議結束之後，小菜跟小美對行程
    print("小菜與小美準備對行程");
    
    // 此方法裡面的內容是 Future，但在此看起來，就像一般的方法調用
    xiaoMeiSchedule();

    // 小菜的行程
    Future.microtask(() {
        print("小菜練習 Flutter");
    });

    // 對完行程
    print("小菜與小美對完行程，小美生氣了");
}
