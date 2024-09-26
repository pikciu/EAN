import Foundation

enum EANChecksum {
    
    static func calculate(for code: [Int]) -> Int {
        let total = code.enumerated()
            .reduce(0) { total, next in
                let (index, digit) = next
                if index % 2 == 0 {
                    return total + digit
                } else {
                    return total + digit * 3
                }
            }
        let result = 10 - total % 10
        return result % 10
    }
    
    static func isValid(code: [Int], checksum: Int) -> Bool {
        calculate(for: code) == checksum
    }
}
