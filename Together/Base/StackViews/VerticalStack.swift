
import UIKit


class VerticalStack: UIStackView {

    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    //MARK: - Private metods
    private func setupUI() {
        self.axis = .vertical
        self.distribution  = .fill
        self.alignment = .fill
        self.spacing = 5
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
