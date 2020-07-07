
import UIKit


class GrayView: UIView {
    
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
        self.backgroundColor = .gray
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
