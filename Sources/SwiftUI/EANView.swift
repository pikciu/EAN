import SwiftUI
import EAN

public struct EANView: View {
    
    private let segments: [Segment]
    
    public init(ean: EAN) {
        self.segments = EANEncoder().segments(for: ean)
    }
    
    public var body: some View {
        GeometryReader { reader in
            Path { path in
                let segmentWidth = reader.size.width / CGFloat(segments.count)
                let containerHeight = reader.size.height
                
                let height: (Segment) -> CGFloat = { segment in
                    switch segment {
                    case .short:
                        containerHeight - 5 * segmentWidth
                    case .long:
                        containerHeight
                    }
                }
                
                segments.enumerated()
                    .forEach { index, segment in
                        if segment.isBlack {
                            let rect = CGRect(
                                x: segmentWidth * CGFloat(index),
                                y: 0,
                                width: segmentWidth,
                                height: height(segment)
                            )
                            path.addRect(rect)
                        }
                    }
            }
            .fill(.black)
        }
    }
}
