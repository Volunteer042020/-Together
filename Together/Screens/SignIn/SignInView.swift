
import UIKit


protocol SignInViewImpl {
    //функции типа, покажи данные
    func viewDidLayoutSubviewsSignInView()
}


final class SignInView: UIView {
    
    //MARK: - Private properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var logoView: UIImageView = {
        let imageView = LogoView(frame: .zero)
        return imageView
    }()
    
    private lazy var loginStack: UIStackView = {
        let stack = VerticalStack()
        return stack
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        return GrayTextField()
    }()
    
    private lazy var logLineView: UIView = {
        return GrayView()
    }()
    
    private lazy var passwordLabel: UILabel = {
        var label = UILabel()
        label.text = "Пароль"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = GrayTextField()
        textField.isSecureTextEntry = true
        
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        //        button.addTarget(self, action: #selector(restoreAction), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var pasLineView: UIView = {
        return GrayView()
    }()
    
    private lazy var logInButton: UIButton = {
        let button = RoundedButtonWithShadow()
        button.setTitle("ВОЙТИ", for: .normal)
        button.backgroundColor = .systemBlue
        //        button.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var restoreStack: UIStackView = {
        let stack = UIStackView()
        stack.axis  = .horizontal
        stack.distribution  = .fill
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var leftRestoreTextViewLine: UIView = {
        let view = GrayView()
        return view
    }()
    
    private lazy var restoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "Нет аккаунта?"
        return label
    }()
    
    private lazy var rightRestoreTextViewLine: UIView = {
        let view = GrayView()
        return view
    }()
    
    private lazy var registerButton: UIButton = {
        let button = RoundedButtonWithShadow()
        button.backgroundColor = .systemGreen
        button.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        //        button.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    //MARK: - Private metods
    fileprivate func setupUI() {
        setupScrollView()
        setupLogo()
        setupLoginStack()
        setupLogInButton()
        setupRestoreStack()
        setupRegisterButton()
    }
    
    private func setupScrollView() {
        self.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                        constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,
                                         constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                          constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupLogo() {
        scrollView.addSubview(logoView)
        
        logoView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        logoView.rightAnchor.constraint(equalTo: scrollView.rightAnchor,
                                        constant: -sideArchoreConctant).isActive = true
        logoView.leftAnchor.constraint(equalTo: scrollView.leftAnchor,
                                       constant: sideArchoreConctant).isActive = true
        logoView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        logoView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    fileprivate func setupLoginStack() {
        scrollView.addSubview(loginStack)
        
        loginStack.addArrangedSubview(emailLabel)
        loginStack.addArrangedSubview(emailTextField)
        loginStack.addArrangedSubview(logLineView)
        loginStack.addArrangedSubview(passwordLabel)
        loginStack.addArrangedSubview(passwordTextField)
        loginStack.addArrangedSubview(pasLineView)
        //подумать и перенести определение высоты в класс GrayView и переименовать после этого в GrayLineView
        logLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        pasLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        loginStack.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 20).isActive = true
        loginStack.leftAnchor.constraint(equalTo: scrollView.leftAnchor,
                                         constant: sideArchoreConctant).isActive = true
        loginStack.rightAnchor.constraint(equalTo: scrollView.rightAnchor,
                                          constant: -sideArchoreConctant).isActive = true
    }
    
    private func setupLogInButton() {
        scrollView.addSubview(logInButton)
        
        logInButton.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 50).isActive = true
        logInButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor,
                                          constant: sideArchoreConctant).isActive = true
        logInButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor,
                                           constant: -sideArchoreConctant).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupRestoreStack() {
        scrollView.addSubview(restoreStack)
        
        restoreStack.addArrangedSubview(leftRestoreTextViewLine)
        restoreStack.addArrangedSubview(restoreLabel)
        restoreStack.addArrangedSubview(rightRestoreTextViewLine)
        //подумать и перенести определение высоты в класс GrayView и переименовать после этого в GrayLineView
        leftRestoreTextViewLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        rightRestoreTextViewLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        restoreLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        restoreStack.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 150).isActive = true
        restoreStack.leftAnchor.constraint(equalTo: loginStack.leftAnchor).isActive = true
        restoreStack.rightAnchor.constraint(equalTo: loginStack.rightAnchor).isActive = true
        
    }
    
    private func setupRegisterButton() {
        scrollView.addSubview(registerButton)
        
        registerButton.topAnchor.constraint(equalTo: restoreStack.bottomAnchor, constant: 20).isActive = true
        registerButton.bottomAnchor.constraint(equalToSystemSpacingBelow: scrollView.bottomAnchor, multiplier: 0).isActive = true
        registerButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor,
                                             constant: sideArchoreConctant).isActive = true
        registerButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor,
                                              constant: -sideArchoreConctant).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}

extension SignInView: SignInViewImpl {
    
    func viewDidLayoutSubviewsSignInView() {
        scrollView.contentSize.height = registerButton.frame.maxY + 5
    }
    //
    //    @objc func logInAction(_ sender: UIButton) {
    //        print("log action")
    //    }
    //
    //    @objc func restoreAction(_ sender: UIButton) {
    //        print("Oyy press me restore")
    //    }
    //
    //    @objc func registerAction(_ sender: UIButton) {
    //        print("Oy press me register")
    //    }
}


//MARK: - Size constant
extension SignInView {
    
    private var sideArchoreConctant: CGFloat {
        return 20
    }
}
