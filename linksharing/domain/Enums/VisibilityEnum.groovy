package Enums
enum VisibilityEnum {
    PRIVATE(0),
    PUBLIC(1),

    final int val
    VisibilityEnum(int val){
        this.val = val
    }
    int value() {
        return this.val;
    }
    static constraints = {
    }
}
