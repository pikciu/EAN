import Testing
@testable import EAN

@Suite("EANEncoder tests")
struct EANEncoderTests {
    
    let encoder = EANEncoder()
    
    @Test("Encode EAN 8")
    func encodeEAN8() {
        let ean = EAN(rawValue: "3482746")
        let segments = ean.map(encoder.segments)
        let expected: [Segment] = [
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(true),
            .long(false),
            .long(true),
            .short(false),
            .short(true),
            .short(true),
            .short(true),
            .short(true),
            .short(false),
            .short(true),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(false),
            .short(true),
            .short(true),
            .short(false),
            .short(true),
            .short(true),
            .short(false),
            .short(true),
            .short(true),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(true),
            .long(false),
            .long(true),
            .long(false),
            .long(true),
            .long(false),
            .short(true),
            .short(false),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(true),
            .short(true),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(false),
            .long(true),
            .long(false),
            .long(true),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
        ]
        #expect(segments == expected)
    }
    
    @Test("Encode EAN 13")
    func encodeEAN13() {
        let ean = EAN(rawValue: "727361251537")
        let segments = ean.map(encoder.segments)
        let expected: [Segment] = [
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(true),
            .long(false),
            .long(true),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(true),
            .short(true),
            .short(true),
            .short(true),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(true),
            .short(false),
            .short(true),
            .short(true),
            .long(false),
            .long(true),
            .long(false),
            .long(true),
            .long(false),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(true),
            .short(true),
            .short(false),
            .short(true),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(true),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(true),
            .short(true),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(false),
            .short(false),
            .short(true),
            .short(true),
            .short(true),
            .short(false),
            .long(true),
            .long(false),
            .long(true),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
            .long(false),
        ]
        #expect(segments == expected)
    }
}
