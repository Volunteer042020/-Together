
import UIKit


class LogoView: UIImageView {

    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    //MARK: - Private metods
    private func setupUI() {
        self.contentMode = .scaleAspectFit
        self.image = UIImage(named: "logo")
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
