
import UIKit
import CoreLocation

/*
  TO DO... Сделать по категорям модели поисковика, отражать слайд меню категории
*/

final class MainMapViewController: UIViewController {
    
    //MARK: - Open properties
    // презентору сообщаем обо всех действиях и передаем данные, например: презентер, была нажата кнопка войти,
    var presenter: MainMapViewActions?
    
    //MARK: - Private properties
    //вью просим отобразить контент
    private lazy var mainView = view as? (MainMapViewImpl & PresenterHaving)
    private var slideMenuViewController: SlideMenuViewController?
    private var visualEffectView: UIVisualEffectView?
    
    private let slideMenuViewControllerHeight: CGFloat = 135
    
    //MARK: - Life cycle
    override func loadView() {
        view = MainView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let presenter = presenter {
            mainView?.setPresenter(presenter)
        }
        setNavigation()
        setupSlideMenuUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    //MARK: - Private metods
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
    private func setupSlideMenuUp() {
        // to do ..
//        visualEffectView = UIVisualEffectView()
//        visualEffectView?.frame = self.view.frame
//        guard let visualView = visualEffectView else { return }

//        self.view.addSubview(visualView)
        slideMenuViewController = SlideMenuViewController()
        guard var slideViewController = slideMenuViewController else { return }
        slideViewController.view.frame = CGRect(x: 0,
                                                y: self.view.frame.height - slideMenuViewControllerHeight ,
                                                width: self.view.frame.width,
                                                height: slideMenuViewControllerHeight)
        
        self.addChild(slideViewController)
        self.view.addSubview(slideViewController.view)
    }
    
    private func setNavigation() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Главная"
    }
}


//MARK: - MainMapViewControllerImpl
extension MainMapViewController: MainMapViewControllerImpl {
    
    func showCurrentLocation(_ currentLocation: CLLocation) {
        mainView?.showUserLocation(currentLocation)
    }
    
    func showEventPins(_ pins: [EventMapPin]) {
        mainView?.showEventPins(pins)
    }
    
}

