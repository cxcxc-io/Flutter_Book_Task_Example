void main() {
    // 以Future的microtask為開頭，串接多個then方法，依序印出 為了要做高效能的APP、我們必須知道異步分工合作、要知道Dart的異步分工機制、可以使用Future、並透過then方法、讓分工有順序性。
    Future.microtask(() {
        return "為了要做高效能的APP";
    }).then((lastTastGoodApp) {
        print(lastTastGoodApp);
        return "我們必須知道異步分工合作";
    }).then((lastTaskAsync) {
        print(lastTaskAsync);
        return "要知道Dart的異步分工機制";
    }).then((lastTaskDartAsync) {
        print(lastTaskDartAsync);
        return "可以使用Future";
    }).then((lastTaskFuture) {
        print(lastTaskFuture);
        return "並透過then方法";
    }).then((lastTaskThen) {
        print(lastTaskThen);
        return "讓分工有順序性";
    }).then((lastTaskOrder) {
        print(lastTaskOrder);
    });
}
