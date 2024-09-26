#if canImport(UIKit)
import UIKit
import EAN

public final class EANView: UIView {
    
    public override class var layerClass: AnyClass {
        BarcodeLayer.self
    }
    
    private let encoder = EANEncoder()
    
    private var barcodeLayer: BarcodeLayer {
        layer as! BarcodeLayer
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .white
    }
    
    public var ean: EAN? {
        didSet {
            barcodeLayer.segments = ean.map(encoder.segments) ?? []
        }
    }
}
#endif
