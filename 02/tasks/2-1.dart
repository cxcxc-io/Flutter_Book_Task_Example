void main() {

    // 有一個文字表達的變數，其變數名為jobInfo，其內容叫做全端工程師。
    String jobInfo = "全端工程師";

    // 有一個文字表達的變數，其變數名為description，其內容叫做「會寫給用戶看的，也會寫接觸資料庫的」。
    String description = "「會寫給用戶看的，也會寫接觸資料庫的」";

    // 有一個數字表達的變數，其變數名為salary，其內容為 35000。
    int salary = 35000;

    // 將這些內容組合成一個大型字串，並使用print印在畫面上。
    print("他是一位" + jobInfo + ", 工作內容是：" + description + "。 他的薪水是： " + salary.toString());

    // 有一個東西，他有兩個特徵，名字是大話AWS雲端架構、重量是140，請用Dart程式語言的方式對這兩個變數進行宣告。
    String bookName = "大話AWS雲端架構";
    int bookWeight = 140;
    print("這本" + bookName + "的重量是：" + bookWeight.toString());
    
}
