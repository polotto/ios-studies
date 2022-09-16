//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
//subtract views ios
//https://jayeshkawli.ghost.io/making-a-hole-in-uiview-with-calayer/
//rounded corner ios
//https://stackoverflow.com/a/34983655/6846888
class MyViewController : UIViewController {
    func generateCircle() {
        print("circle")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        generateCircle()
        
                let radius:CGFloat = 8
                let backgroundColor: UIColor = UIColor.red
                let borderPlace: BorderPlace = BorderPlace.bottomRight
                
                // ---------------------
                let square = UIView()
                square.frame = CGRect(x: 0, y: 0, width: radius, height: radius)
                square.backgroundColor = backgroundColor

                let maskLayer = CAShapeLayer()
                maskLayer.frame = square.bounds
                
                let rect: CGRect
                switch borderPlace {
                case .topLeft:
                    rect = CGRect(x: 0, y: 0, width: 2 * radius, height: 2 * radius)
                    break
        
                case .topRight:
                    rect = CGRect(x: -radius, y: 0, width: 2 * radius, height: 2 * radius)
                    break
        
                case .bottomLeft:
                    rect = CGRect(x: 0, y: -radius, width: 2 * radius, height: 2 * radius)
                    break
        
                case .bottomRight:
                    rect = CGRect(x: -radius, y: -radius, width: 2 * radius, height: 2 * radius)
                    break
                }

                let circlePath = UIBezierPath(ovalIn: rect)
                let path = UIBezierPath(rect: square.bounds)
                path.append(circlePath)

                maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
                maskLayer.path = path.cgPath

                square.layer.mask = maskLayer
                
        
        view.addSubview(square)
        self.view = view
    }
    
    enum BorderPlace {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
