void main() {
    /// Map 宣告方式
    ///
    /// Map<key的型別， value 的型別> 變數名 = {key1: value1, key2: value2}
    /// 取值方式：變數名[key1]
    Map<String, String> positionMap = {
        "generalManager": "bing-hong",
        "humanResource": "xiao-tsai",
        "accounting": "xiao-mei"
    };
    // 取出 positionMap 裡面 key 為 generalManager 的內容值
    print(positionMap['generalManager']);
    // 為 positionMap 增加一對新鍵值
    positionMap['partTime'] = "xiao-black";
    print(positionMap['partTime']);

    /// 提取所有 key
    ///
    /// 有的時候，key 很多，可以透過 keys 直接提取 Map 裡面的所有 key
    /// 下面案例，為取出所有 key 之後，將每個key 分別做迴圈，逐步打印出內容
    for (String key in positionMap.keys) {
        print("postitionMap的key是 $key 時，value為 ${positionMap[key]}");
    }

    /// 增加多組鍵值
    ///
    /// 有的時候，會因為業務場景的突發，比如職缺增加，而要多增加幾組鍵值
    /// 就可以使用 addALL({key3: value3, key4: value4})
    positionMap.addAll({"worker": "somebody"});
    print(positionMap);

    Map<String, int> exampleMap = {"key1": 1, "key2": 2, "key3": 3};
    Map<int, int> exampleMap2 = {2: 999, 1: 123};
}
