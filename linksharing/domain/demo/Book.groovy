package demo

class Book {
    static title
    Integer price
    static belongsTo = [author:Author]
    static constraints = {
    }
}
