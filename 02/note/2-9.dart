void main() {
    // 召開會議
    print("會議召開，這是一次特別任務。");

    // 跟小美交付任務，稍後執行
    Future.delayed(
        Duration(seconds: 1),
        () {print("小美收到下台中的任務。開時準備行囊。");}
    );

    // 跟小菜交付任務，稍後執行
    Future.microtask(
        () {print("小菜練習 Flutter 應用");}
    );

    print("會議結束");
}
