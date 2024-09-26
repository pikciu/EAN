import Testing
@testable import EAN

@Suite("Init EAN without checksum")
struct WithoutChecksum {
    
    @Test func initEAN8() {
        let ean = EAN(rawValue: "9638507")
        #expect(ean?.rawValue == "96385074")
        #expect(ean?.code == [9, 6, 3, 8, 5, 0, 7])
        #expect(ean?.checksum == 4)
    }
    
    @Test func initEAN13() {
        let ean = EAN(rawValue: "995606386944")
        #expect(ean?.rawValue == "9956063869447")
        #expect(ean?.code == [9, 9, 5, 6, 0, 6, 3, 8, 6, 9, 4, 4])
        #expect(ean?.checksum == 7)
    }
}

@Suite("Init EAN with checksum")
struct WithChecksum {
    
    @Test func initEAN8() {
        let ean = EAN(rawValue: "96385074")
        #expect(ean?.rawValue == "96385074")
        #expect(ean?.code == [9, 6, 3, 8, 5, 0, 7])
        #expect(ean?.checksum == 4)
    }
    
    @Test func initEAN13() {
        let ean = EAN(rawValue: "9956063869447")
        #expect(ean?.rawValue == "9956063869447")
        #expect(ean?.code == [9, 9, 5, 6, 0, 6, 3, 8, 6, 9, 4, 4])
        #expect(ean?.checksum == 7)
    }
}

@Suite("Init EAN with invalid checksum")
struct WithInvalidChecksum {
    
    @Test func initEAN8() {
        let ean = EAN(rawValue: "96385071")
        #expect(ean == nil)
    }
    
    @Test func initEAN13() {
        let ean = EAN(rawValue: "9956063869442")
        #expect(ean == nil)
    }
    
    @Test func initInvalidEAN() {
        let ean = EAN(rawValue: "159")
        #expect(ean == nil)
    }
}
