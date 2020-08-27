
import UIKit
import CoreLocation

/*
  TO DO... Сделать по категорям модели поисковика, отражать слайд меню категории
*/

final class MainMapViewController: UIViewController {
    
    //MARK: - Open properties

    var presenter: MainMapViewActions?
    var slideMenuViewController: SlideMenuViewController?
    
    //MARK: - Private properties
    private lazy var mainView = view as? (MainMapViewImpl & PresenterHaving)
    
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
        presenter?.viewDidLoad()
        presenter?.setupSlideMenu()
        showSlideMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    //MARK: - Private metods
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере

    private func showSlideMenu() {

        guard let slideViewController = slideMenuViewController
            else { return }
        self.view.addSubview(slideViewController.view)
    }
    
    private func setNavigation() {
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
    
    func showAlertIsDisabled() {
      showBasicAlertMap("У вас выключена служба локации.", "Хотите включить, чтоб мы могли определить где вы находитесь?", URL(string: "App-Prefs:root=LOCATION-SERVICES"))
    }
    
    func showAlertAccessRestricted() {
        showBasicAlertMap("Вы запретили использования вашего местоположения.", "Возможность определения вашего местоположения позволит показать вам ближайшие активные просьбы помощи?", URL(string: UIApplication.openSettingsURLString))
    }
    
    func showAlertUnkownError() {
        showBasicAlertCheck("Не обработанная ошибка", "Скоро исправим")
    }
}
