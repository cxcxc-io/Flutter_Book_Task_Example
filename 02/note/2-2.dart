
/// 函數的宣告方式
///
/// ```dart
/// 函數回傳值的型別 函數名(函數的參數) {
///   // 函數的操作邏輯
///   ...
///   return 內容，此內容的資料型別，必須與函數回傳值的型別一樣
/// }
/// ```

// 一個回傳整數的函數，裡面不具任何參數，名為 returnIntWithoutParameter
// 在裡面計算之後，透過 return 回傳結果，此結果的資料型態與函數所定義的相通
int returnIntWithoutParameter() {
    int result = 1 + 20;
    return result;
}

// 一個回傳浮點數的函數，裡面具有一個參數為 inputInt，名為 returnDoubleWithParameter
// 在裡面計算之後，透過 return 回傳結果，此結果的資料型態與函數所定義的相通
double returnDoubleWithParameter(int inputInt) {
    double result = inputInt * 100 / 20;
    return result;
}

// 一個回傳字串的函數，裡面具有一個參數為 inputStr，名為 returnStringWithPatameter
// 在裡面計算之後，透過 return 回傳結果，此結果的資料型態與函數所定義的相通
String returnStringWithParameter(String inputStr) {
    String result = inputStr + "是一個字串";
    return result;
}

// 不需回傳值的函數，名為 withoutReturnValueJustExecute
// 在裡面調度具有外部作用的內容，且後續不需引回，繼續使用的內容
void withoutReturnValueJustExecute() {
    print("沒有回傳資料的函數，用 void 宣告此方法的回傳值型別");
}

void main() {

    print("===沒有參數的函數，取值===");
    int getIntValueFromFunction = returnIntWithoutParameter();
    print(getIntValueFromFunction);

    print("===在函數動態輸入數字，取值===");
    double getDoubleFromFunctionParameter1 = returnDoubleWithParameter(5);
    double getDoubleFromFunctionParameter2 = returnDoubleWithParameter(2);
    print(getDoubleFromFunctionParameter1);
    print(getDoubleFromFunctionParameter2);

    print("===在函數動態輸入文字，取值===");
    String getStringFromFuntionPArameter1 = returnStringWithParameter("雲育鏈");
    String getStringFromFuntionPArameter2 = returnStringWithParameter("大話 AWS");
    print(getStringFromFuntionPArameter1);
    print(getStringFromFuntionPArameter2);

    print("===不需接收回傳值，調度函數===");
    withoutReturnValueJustExecute();
}
