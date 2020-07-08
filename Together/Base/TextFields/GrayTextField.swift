
import UIKit


class GrayTextField: UITextField {
    
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
        self.textColor = .gray
        self.tintColor = .customGray
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
