import UIKit
extension UIView {
    var globalFrame: CGRect {
        superview?.convert(frame, to: nil) ?? .zero
    }
}

extension UIView {
    var snapshot: UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
        return renderer.image { (context) in
            self.layer.render(in: context.cgContext)
        }
    }
}


extension UITabBar {
    func snapshotDataForTab(atIndex index: Int) -> (UIImage, CGRect) {
        var tabs = subviews.compactMap { (view: UIView) -> UIControl? in
            if let view = view as? UIControl {
                return view
            }
            return nil
        }
        tabs.sort(by: { $0.frame.origin.x < $1.frame.origin.x })
        return (tabs[index].snapshot, tabs[index].globalFrame)
    }
}
