// 定義一個會回傳字串的方法，函數名為iAmStringFunction，並帶有字串型別的函數參數 iAmString, 之後回傳字串為 雲育鏈+該參數的內容。
String iAmStringFunction(String iAmString) {
    String result = "雲育鏈" + iAmString;
    return result;
}

// 定義一個會回傳數字的方法，函數名為iAmIntFunction，並帶有字串型別的函數參數 iAmInt, 之後回傳數字為 該參數*20。
int iAmIntFunction(int iAmInt) {
    int result = iAmInt * 20;
    return result; 
}

// 定義一個不回傳內容的方法，函數名為iWillNotReturnValue，在裡面設置print(“通常會用於與資料庫、硬碟等外部系統接觸的情境”);。
void iWillNotReturnValue() {
  print("通常會用於與資料庫、硬碟等外部系統接觸的情境");
}

void main() {

    String getString = iAmStringFunction("好棒棒！");
    print(getString);

    int getInt = iAmIntFunction(6);
    print(getInt);

    iWillNotReturnValue();

}
