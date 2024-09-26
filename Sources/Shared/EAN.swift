import Foundation

public struct EAN: RawRepresentable, Hashable {
    public let code: [Int]
    public let checksum: Int
    
    let isEAN13: Bool
    
    private var separatorIndex: Int {
        isEAN13 ? 7 : 4
    }
    
    private var startIndex: Int {
        isEAN13 ? 1 : 0
    }
    
    var left: ArraySlice<Int> {
        code[startIndex..<separatorIndex]
    }
    
    var right: ArraySlice<Int> {
        code[separatorIndex...]
    }
    
    public var rawValue: String {
        var code = code
        code.append(checksum)
        return code.map(String.init).joined()
    }
    
    private init?(code: [Int], checksum: Int?) {
        self.code = code
        self.isEAN13 = code.count == 12
        if let checksum {
            if EANChecksum.isValid(code: code, checksum: checksum) {
                self.checksum = checksum
            } else {
                return nil
            }
        } else {
            self.checksum = EANChecksum.calculate(for: code)
        }
    }
    
    private init?(code: Substring, checksum: Substring?) {
        self.init(
            code: code.compactMap { Int(String($0)) },
            checksum: checksum.map { Int(String($0)) } ?? nil
        )
    }
    
    private init?(output: EANRegex.Ouput) {
        self.init(code: output.1, checksum: output.2)
    }
    
    public init?(rawValue: String) {
        if let ean13 = rawValue.firstMatch(of: EANRegex.ean13) {
            self.init(output: ean13.output)
        } else if let ean8 = rawValue.firstMatch(of: EANRegex.ean8) {
            self.init(output: ean8.output)
        } else {
            return nil
        }
    }
}
