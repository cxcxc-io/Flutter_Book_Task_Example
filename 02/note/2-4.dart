void main() {
    /// String List
    /// 
    /// List<資料型態> 變數名 = [element1, element2, element3];
    List<String> menList = ["王小明", "李小菜", "雲育鏈"];

    // 取用個別元素
    // List[]
    print("========== List元素取用方式 ==========");
    print(menList[0]);
    print(menList[2]);

    /// for loop 數字序列號版本
    ///
    /// for (初始基準值; 終止條件; 每一次執行的基準值調整方式) { 執行邏輯 }
    print("========== for loop 數字序列號版本 ==========");
    for (int index = 0; index < menList.length; index++) {
        print(menList[index]);
    }

    /// for loop 元素遍歷版
    ///
    /// for (資料型別 元素的短期變數名 in 我方建立的集合) { 執行邏輯 }
    print("========== for loop 元素遍歷版 ==========");  
    for (String men in menList) {
        print(men + "送早餐給小美");
    }

    List<int> iAmList = [1, 2, 3, 4, 5, 6];
    List<bool> iAmBoolList = [true, false, false, true];
}
