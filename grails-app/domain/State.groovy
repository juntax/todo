class State implements Serializable {
    //
    static hasMany = [issues : Issue]

    //状態
    String name


    static constraints = {
        name(blank:false)
    }

    String toString() {
        name
    }
}
