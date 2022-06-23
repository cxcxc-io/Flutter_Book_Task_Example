void main() {
    // 會議結束之後，小菜跟小美對行程
    print("小菜與小美準備對行程");

    // 小美的行程
    Future.microtask(() {
        return "吃中餐";
    }).then((lastTaskEatLunch) {
        // 印中吃中餐
        print(lastTaskEatLunch);
        return "訂高鐵票";
    }).then((lastTaskHighRoadway) {
        // 印出訂高鐵票
        print(lastTaskHighRoadway);
        return "搭車去高鐵";
    }).then((lastTaskTakeTaxi) {
        // 印出搭車去高鐵
        print(lastTaskTakeTaxi);
    });

    // 小菜的行程
    Future.microtask(() {
        print("練習 Flutter");
    });

    // 對完行程
    print("小菜與小美對完行程，小美生氣了");
}
