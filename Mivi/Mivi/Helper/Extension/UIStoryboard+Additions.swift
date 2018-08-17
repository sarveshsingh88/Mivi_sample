
import Foundation
import UIKit

extension UIStoryboard {
    
    enum Storyboard: String {
        case LaunchScreen
        case Main
        case Login
        
        var filename: String {
            return rawValue
        }
        
        var instance: UIStoryboard {
            return UIStoryboard(name: self.rawValue, bundle: .main)
        }
    }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = .main) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = .main) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    class func storyboard(_ storyboard: Storyboard) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: nil)
    }
    
    
    // MARK: - View Controller Instantiation from Generics
    
    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        return viewController
    }
}



// MARK: Protocol

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
