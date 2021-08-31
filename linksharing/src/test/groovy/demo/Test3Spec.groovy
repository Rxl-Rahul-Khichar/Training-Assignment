package demo

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class Test3Spec extends Specification implements DomainUnitTest<Test3> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
