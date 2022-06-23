void main() {
    // 設計一個主程序，會印出會議開始，中間過程透過Future.delayed印出請老何訂購餐點，再透過Future.microtask印出請老何定機票，最後在主程序印出會議結束
    print("會議開始");

    Future.delayed(
        Duration(seconds: 1),
        () {print("請老何訂購餐點");}
    );

    Future.microtask(
        () {print("請老何訂機票");}
    );
    
    print("會議結束");
}
