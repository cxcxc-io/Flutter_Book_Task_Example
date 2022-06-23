void main() async {

    // 以Future的microtask為開頭，串接多個then方法，依序印出 為了要做高效能的APP、我們必須知道異步分工合作、要知道Dart的異步分工機制、透過建立一個新函數，並使用async與await、讓分工有順序性。
    String lastTask = await Future.microtask(() {
        return "為了要做高效能的APP"; 
    });

    if (lastTask == "為了要做高效能的APP") {
        print(lastTask);
        lastTask = "我們必須知道異步分工合作";
    };
    
    if (lastTask == "我們必須知道異步分工合作") {
        print(lastTask);
        lastTask = "要知道Dart的異步分工機制";
    };

    if (lastTask == "要知道Dart的異步分工機制") {
        print(lastTAsk);
        lastTask = "透過建立一個新函數";
    };

    if (lastTAsk == "透過建立一個新函數") {
        print(lastTask);
        lastTask = "並使用async與await";
    };
    
    if (lastTask == "並使用async與await") {
        print(lastTask);
        lastTask = "讓分工有順序性";
    };

    if(lastTask == "讓分工有順序性") {
        print(lastTask);
    };  
}
