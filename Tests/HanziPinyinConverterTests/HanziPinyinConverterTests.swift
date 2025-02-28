import XCTest
@testable import HanziPinyinConverter

final class HanziPinyinConverterTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        HanziPinyinConverter.loadPinyinData() // Load data before tests
    }

    func testPinyinConversion() {
        XCTAssertEqual(HanziPinyinConverter.convert("中国", toneMarks: true), "zhōng guó")
        XCTAssertEqual(HanziPinyinConverter.convert("你好", toneMarks: true), "nǐ hǎo")
    }
}
