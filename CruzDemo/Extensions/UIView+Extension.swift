//
//  UIView+Extension.swift
//   
//
//   
//

import UIKit.UIView

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
    
    func removeGradientsBack() {
        guard let sublayers = self.layer.sublayers else {
            return
        }
        var newSubLayers: [CALayer] = []
        for layer in sublayers {
            if !layer.isKind(of: CAGradientLayer.self) {
                newSubLayers.append(layer)
            }
        }
        self.layer.sublayers = newSubLayers
    }
    
    func linearGradientBackground(angleInDegs: Int, colors: [UIColor], radius: CGFloat) {
        // Create New Gradient Layer
        let gradientBaseLayer: CAGradientLayer = CAGradientLayer()
        // Feed in Our Parameters
        var color: [CGColor] = []
        for col in colors {
            color.append(col.cgColor)
        }
        gradientBaseLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        gradientBaseLayer.colors = color
        gradientBaseLayer.cornerRadius = radius
        gradientBaseLayer.startPoint = startAndEndPointsFrom(angle: angleInDegs).startPoint
        gradientBaseLayer.endPoint = startAndEndPointsFrom(angle: angleInDegs).endPoint
        // Add Our Gradient Layer to the Background
        self.layer.insertSublayer(gradientBaseLayer, at: 0)
    }
    
    private func startAndEndPointsFrom(angle: Int) -> (startPoint:CGPoint, endPoint:CGPoint) {
        // Set default points for angle of 0°
        var startPointX:CGFloat = 0.5
        var startPointY:CGFloat = 1.0

        // Define point objects
        var startPoint:CGPoint
        var endPoint:CGPoint

        // Define points
        switch true {
            // Define known points
            case angle == 0:
                startPointX = 0.5
                startPointY = 1.0
            case angle == 45:
                startPointX = 0.0
                startPointY = 1.0
            case angle == 90:
                startPointX = 0.0
                startPointY = 0.5
            case angle == 135:
                startPointX = 0.0
                startPointY = 0.0
            case angle == 180:
                startPointX = 0.5
                startPointY = 0.0
            case angle == 225:
                startPointX = 1.0
                startPointY = 0.0
            case angle == 270:
                startPointX = 1.0
                startPointY = 0.5
            case angle == 315:
                startPointX = 1.0
                startPointY = 1.0
            // Define calculated points
            case angle > 315 || angle < 45:
                startPointX = 0.5 - CGFloat(tan(angle.degreesToRads()) * 0.5)
                startPointY = 1.0
            case angle > 45 && angle < 135:
                startPointX = 0.0
                startPointY = 0.5 + CGFloat(tan(90.degreesToRads() - angle.degreesToRads()) * 0.5)
            case angle > 135 && angle < 225:
                startPointX = 0.5 - CGFloat(tan(180.degreesToRads() - angle.degreesToRads()) * 0.5)
                startPointY = 0.0
            case angle > 225 && angle < 359:
                startPointX = 1.0
                startPointY = 0.5 - CGFloat(tan(270.degreesToRads() - angle.degreesToRads()) * 0.5)
            default: break
        }
        // Build return CGPoints
        startPoint = CGPoint(x: startPointX, y: startPointY)
        endPoint = startPoint.opposite()
        // Return CGPoints
        return (startPoint, endPoint)
    }
}
