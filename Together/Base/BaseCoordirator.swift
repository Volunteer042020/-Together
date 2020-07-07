
import UIKit


protocol Coordinator: AnyObject {
    var parentCoordinator: BaseCoordirator? { get set }
    var childCoordinators: [BaseCoordirator] { get set }
    
    func start()
}


class BaseCoordirator: Coordinator {
    
    //MARK: - Coordinator
    weak var parentCoordinator: BaseCoordirator?
    var childCoordinators: [BaseCoordirator] = []
    
    
    func start() {
        print("Will be redefined in childrens")
    }
}
