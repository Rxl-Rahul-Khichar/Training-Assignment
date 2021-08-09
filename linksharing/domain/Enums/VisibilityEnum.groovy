package Enums
enum VisibilityEnum {
    PRIVATE(0),
    PUBLIC(1),

    private final int val
    VisibilityEnum(int val){
        this.val = val
    }
    int value() {
        return this.val
    }
    static constraints = {
    }
}
