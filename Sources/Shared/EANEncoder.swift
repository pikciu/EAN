import Foundation

public final class EANEncoder {
    
    enum Encoding {
        // swiftlint:disable:next identifier_name
        case a, b, c
        
        var scheme: [Int: [Bool]] {
            switch self {
            case .a:
                [
                    0: [false, false, false, true, true, false, true],
                    1: [false, false, true, true, false, false, true],
                    2: [false, false, true, false, false, true, true],
                    3: [false, true, true, true, true, false, true],
                    4: [false, true, false, false, false, true, true],
                    5: [false, true, true, false, false, false, true],
                    6: [false, true, false, true, true, true, true],
                    7: [false, true, true, true, false, true, true],
                    8: [false, true, true, false, true, true, true],
                    9: [false, false, false, true, false, true, true],
                ]
            case .b:
                [
                    0: [false, true, false, false, true, true, true],
                    1: [false, true, true, false, false, true, true],
                    2: [false, false, true, true, false, true, true],
                    3: [false, true, false, false, false, false, true],
                    4: [false, false, true, true, true, false, true],
                    5: [false, true, true, true, false, false, true],
                    6: [false, false, false, false, true, false, true],
                    7: [false, false, true, false, false, false, true],
                    8: [false, false, false, true, false, false, true],
                    9: [false, false, true, false, true, true, true],
                ]
            case .c:
                [
                    0: [true, true, true, false, false, true, false],
                    1: [true, true, false, false, true, true, false],
                    2: [true, true, false, true, true, false, false],
                    3: [true, false, false, false, false, true, false],
                    4: [true, false, true, true, true, false, false],
                    5: [true, false, false, true, true, true, false],
                    6: [true, false, true, false, false, false, false],
                    7: [true, false, false, false, true, false, false],
                    8: [true, false, false, true, false, false, false],
                    9: [true, true, true, false, true, false, false],
                ]
            }
        }
        
        func segments(for digit: Int) -> [Segment] {
            scheme[digit]?.map { Segment.short($0) } ?? []
        }
        
        static let schmes: [Int: [Encoding]] = [
            0: [.a, .a, .a, .a, .a, .a],
            1: [.a, .a, .b, .a, .b, .b],
            2: [.a, .a, .b, .b, .a, .b],
            3: [.a, .a, .b, .b, .b, .a],
            4: [.a, .b, .a, .a, .b, .b],
            5: [.a, .b, .b, .a, .a, .b],
            6: [.a, .b, .b, .b, .a, .a],
            7: [.a, .b, .a, .b, .a, .b],
            8: [.a, .b, .a, .b, .b, .a],
            9: [.a, .b, .b, .a, .b, .a],
        ]

    }
    
    public init() { }
    
    public func segments(for ean: EAN) -> [Segment] {
        segments(for: ean).flatMap { $0 }
    }
    
    func segments(for ean: EAN) -> [[Segment]] {
        var segments = [Segment.leftMargin, Segment.startStop]
        if ean.isEAN13 {
            let scheme = Encoding.schmes[ean.code[0]] ?? []
            segments += zip(scheme, ean.left)
                .map { encoding, digit in
                    encoding.segments(for: digit)
                }
        } else {
            segments += ean.left.map { digit in
                Encoding.a.segments(for: digit)
            }
        }
        
        segments += [Segment.separator]
        segments += ean.right.map { digit in
            Encoding.c.segments(for: digit)
        }
        
        segments += [
            Encoding.c.segments(for: ean.checksum),
            Segment.startStop,
            Segment.rightMargin,
        ]
        return segments
    }
}
