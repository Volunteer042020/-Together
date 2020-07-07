
import UIKit

//сокращает код создания VC до 1 строки, главное явно определить тип VC
//let vc: SignInViewController = UIStoryboard.main.instantiate()

extension UIStoryboard {
    func instantiate<T>() -> T {
        return instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }

    static let main = UIStoryboard(name: "Main", bundle: nil)
}
