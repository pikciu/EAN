#if canImport(UIKit)
import UIKit
import EAN

public final class BarcodeLayer: CALayer {
    public var segments = [Segment]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override func draw(in ctx: CGContext) {
        let segmentWidth = bounds.width / CGFloat(segments.count)
        
        ctx.setFillColor(UIColor.black.cgColor)
        segments.enumerated()
            .forEach { index, segment in
                if segment.isBlack {
                    let rect = CGRect(
                        x: segmentWidth * CGFloat(index),
                        y: 0,
                        width: segmentWidth,
                        height: height(for: segment, width: segmentWidth)
                    )
                    ctx.addRect(rect)
                }
            }
        ctx.fillPath()
    }
    
    private func height(for segment: Segment, width: CGFloat) -> CGFloat {
        switch segment {
        case .short:
            bounds.height - 5 * width
        case .long:
            bounds.height
        }
    }
}
#endif
