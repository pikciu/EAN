import Foundation

enum EANRegex {
    
    typealias Ouput = (Substring, Substring, Substring?)
    
    static var ean13: Regex<Ouput> {
        /^([0-9]{12})([0-9])?$/
    }
    
    static var ean8: Regex<Ouput> {
        /^([0-9]{7})([0-9])?$/
    }
}
