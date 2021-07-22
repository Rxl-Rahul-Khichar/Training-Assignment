package Enums
enum SeriousnessEnum {
    casual(0),
    serious(1),
    verySerious(2),

    final int val
    SeriousnessEnum(int val){
        this.val = val
    }
    int value() {
        return this.val
    }
    static constraints = {
    }
}
