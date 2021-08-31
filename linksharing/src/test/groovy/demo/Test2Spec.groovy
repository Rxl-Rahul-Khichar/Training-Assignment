package demo

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class Test2Spec extends Specification implements DomainUnitTest<Test2> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
