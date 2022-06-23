void main() {

    // 有一個家庭，爸爸是李小鴻，媽媽是秉鴻李，兒子是李小秉，請將father、 mother, son作為Map的key，並將內容填入。
    Map<String, String> family = {
        "father": "李小鴻",
        "mother": "秉鴻李",
        "son": "李小秉"
    };

    // 接續上一題，家庭後來有了女兒daughter，女兒叫作 李小花，請為先前建置的Map，追加一個新的鍵值。
    family['daughter'] = "李小花";
    print(family);
}
