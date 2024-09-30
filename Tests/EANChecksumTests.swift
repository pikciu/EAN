import Testing
@testable import EAN

@Suite("EAN 8 checksum")
struct EAN8Cheksum {
    
    @Test("Calculate checksum")
    func calculateChecksum() {
        let checksum = EANChecksum.calculate(for: [7, 6, 5, 4, 3, 2, 1])
        #expect(checksum == 0)
    }
    
    @Test("Validate invalid checksum")
    func validateInvalid() {
        let isValid = EANChecksum.isValid(
            code: [9, 0, 3, 1, 1, 0, 1],
            checksum: 9
        )
        #expect(isValid == false)
    }
    
    @Test("Validate valid checksum")
    func validateValid() {
        let isValid = EANChecksum.isValid(
            code: [3, 9, 5, 7, 2, 3, 5],
            checksum: 6
        )
        #expect(isValid == true)
    }
}

@Suite("EAN 13 checksum")
struct EAN13Cheksum {
    
    @Test("Calculate checksum")
    func calculateChecksum() {
        let checksum = EANChecksum.calculate(for: [9, 7, 8, 0, 2, 0, 1, 3, 7, 9, 6, 2])
        #expect(checksum == 4)
    }
    
    @Test("Validate invalid checksum")
    func validateInvalid() {
        let isValid = EANChecksum.isValid(
            code: [8, 4, 7, 2, 6, 5, 9, 0, 3, 4, 1, 2],
            checksum: 1
        )
        #expect(isValid == false)
    }
    
    @Test("Validate valid checksum")
    func validateValid() {
        let isValid = EANChecksum.isValid(
            code: [7, 3, 7, 4, 5, 1, 4, 3, 8, 5, 9, 9],
            checksum: 5
        )
        #expect(isValid == true)
    }
}
