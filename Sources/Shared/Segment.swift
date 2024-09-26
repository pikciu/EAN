import Foundation

public enum Segment: Equatable, Sendable {
    case short(Bool)
    case long(Bool)
    
    public var isBlack: Bool {
        switch self {
        case .short(let isBlack), .long(let isBlack):
            return isBlack
        }
    }
    
    static let leftMargin = Array(repeating: Segment.long(false), count: 11)
    static let rightMargin = Array(repeating: Segment.long(false), count: 7)
    static let startStop: [Segment] = [
        .long(true),
        .long(false),
        .long(true),
    ]
    static let separator: [Segment] = [
        .long(false),
        .long(true),
        .long(false),
        .long(true),
        .long(false)
    ]
}
