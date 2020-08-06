
import UIKit
import CoreLocation

/*
  TO DO... Сделать по категорям модели поисковика, отражать слайд меню категории
*/

final class MainMapViewController: UIViewController {
    
    //MARK: - Open properties
    // презентору сообщаем обо всех действиях и передаем данные, например: презентер, была нажата кнопка войти
    enum SlideState {
        case expanded
        case collapsed
    }
    
    var presenter: MainMapViewActions?
    var slideMenuViewController: SlideMenuViewController!
    
    //MARK: - Private properties
    private let slideViewHeight: CGFloat = 600
    private let slideHandleAreaHeight: CGFloat = 150
    
    private var slideViewVisible = false
    private var nextState: SlideState {
        return slideViewVisible ? .collapsed : .expanded
    }
    
    private var runningAnimations = [UIViewPropertyAnimator]()
    private var animationProgressWhenInterrupted: CGFloat = 0
    //вью просим отобразить контент
    private lazy var mainView = view as? (MainMapViewImpl & PresenterHaving)
    private var visualEffectView: UIVisualEffectView?
    
    private let slideMenuViewControllerHeight: CGFloat = 145
    
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
        presenter?.setupSlideMenu()
        showSlideMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    //MARK: - Private metods
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
    private func showSlideMenu() {
        // to do ..
        visualEffectView = UIVisualEffectView()
        visualEffectView?.frame = self.view.bounds
        visualEffectView?.alpha = 0
        guard let visualView = visualEffectView else { return }

        self.view.addSubview(visualView)
        
//        guard let slideViewController = slideMenuViewController else { return }
        slideMenuViewController.view.frame = CGRect(x: 0,
                                                y: self.view.frame.height - slideMenuViewControllerHeight ,
                                                width: self.view.bounds.width,
                                                height: slideViewHeight)
        
        //self.addChild(slideViewController)
        self.view.addSubview(slideMenuViewController.view)
//        slideMenuViewController.view.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMapViewController.handleSearchTap(recognizer:)))
        let panGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMapViewController.handleSearchPan(recognizer:)))
        
        slideMenuViewController.view.addGestureRecognizer(tapGestureRecognizer)
        slideMenuViewController.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    private func setNavigation() {
        navigationItem.title = "Главная"
    }
    
    @objc func handleSearchTap(recognizer: UITapGestureRecognizer) {
        
    }
    
    @objc func handleSearchPan(recognizer: UITapGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            print("start")
            startInterectiveTransition(state: nextState, duration: 0.9)
        case .changed:
            print("update")
            updateInterectiveTransition(fractionCompleted: 0)
        case .ended:
            print("continue")
            continueInterectiveTransition()
        default:
            break
        }
    }
    
    private func animateTransitionIfNeeded(state: SlideState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration,
                                                       dampingRatio: 1) {
                                                        switch state {
                                                        case .expanded:
                                                            self.slideMenuViewController.view.frame.origin.y = self.view.frame.height - self.slideViewHeight
                                                        case .collapsed:
                                                            self.slideMenuViewController.view.frame.origin.y = self.view.frame.height - self.slideHandleAreaHeight
                                                        }
            }
            
            frameAnimator.addCompletion { (_) in
                self.slideViewVisible = !self.slideViewVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
        }
    }
    
    private func startInterectiveTransition(state: SlideState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            print("run animations")
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    private func updateInterectiveTransition(fractionCompleted: CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    private func continueInterectiveTransition() {
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
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

