class Issue implements Serializable {
    static belongsTo = [state : State]

    // タイトル
    String title
    // 内容
    String description
    // 開始日
    Date opened
    // 終了日
    Date closed
    // 深さ
    int deeps
    // 関連
    int referenceId

    static constraints = {
        title(blank:false)
        description()
        opened()
        closed()
        deeps()
        referenceId()
    }
}
