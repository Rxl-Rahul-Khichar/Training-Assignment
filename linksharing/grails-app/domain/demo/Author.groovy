package demo

class Author {
    String fName
    String lName
    long authorId

    static hasMany = [book:Book]
    static mapping = {
        table "people"
        fName column: 'fName'
        id name: "authorId"
    }
    static constraints = {
        fName(nullable: true)
    }

}
