package demo

class Employee {
    String firstName
    String lastName
    Integer id
    static constraints = {
        firstName blank: false, nullable: false
        id unique: true

    }
}
