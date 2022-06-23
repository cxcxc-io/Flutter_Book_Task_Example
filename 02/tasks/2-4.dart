import 'dart:io';

void main() {

    // 建立一個整數的List集合，內容為 [ 3,5,6,1,2 ]
    List<int> intList = [3, 5, 6, 1, 2];

    // 使用 數字序列號的迴圈方式，為Q1的List內的數字作加總
    int sum = 0;
    for (int i = 0; i < intList.length; i++) {
        sum = sum + intList[i];
    }
    print(sum);

    // 以元素遍歷版的迴圈方式，為Q1的List內的數字作加總
    int sum2 = 0;
    for (int i in intList) {
        sum2 = sum2 + i;
    }
    print(sum2);

    // 以迴圈的方式，印出4階層的星星左上三角金字塔
    for (int n = 1; n <= 4; n++) {
        print("*" * n);
    }

    // 以迴圈的方式，印出一個9*9的九九乘法表
    for (int x = 1; x <= 9; x++) {
        for (int y = 1; y <= 9; y++) {
            stdout.write(y.toString() + " x " + x.toString() + " = " + (x*y).toString() + " | ");
        }
        print("\n");
    }
    // 以迴圈的方式，print出一個9*9的九九乘法表
    for (int x = 1; x <= 9; x++) {
        for (int y = 1; y <= 9; y++) {
            print(x.toString() + " x " + y.toString() + " = " + (x*y).toString());
        }
        print("\n");
    }
}