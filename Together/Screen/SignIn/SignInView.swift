
import UIKit


protocol SignInViewImpl {
    
    //функции типа, покажи данные
    func viewDidLayoutSubviewsSignInView()
}

final class SignInView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.gray
        label.text = "Ваш E-mail"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.textColor = UIColor.gray
        textField.tintColor = UIColor.gray
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.textAlignment = .left
        textField.alpha = 80/100
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var logLineView: UIView = {
        let view = UIView()
        view.alpha = 12/100
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var passwordLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.gray
        label.text = "Ваш пароль"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.textColor = UIColor.gray
        textField.tintColor = UIColor.gray
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.textAlignment = .left
        textField.alpha = 80/100
        textField.isSecureTextEntry = true
        
        let button = UIButton()
        button.backgroundColor = .clear
        button.alpha = 54/100
        button.setTitle("не помню", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
//        button.addTarget(self, action: #selector(restoreAction), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var pasLineView: UIView = {
        let view = UIView()
        view.alpha = 12/100
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var restoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.alpha = 54/100
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.text = "Нету аккаунта?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("ВОЙТИ", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
//        button.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemGreen
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
//        button.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        return button
    }()
    
    lazy var firstLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    lazy var secondLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(scrollView)
        
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor , constant: -85).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        setupLogo()
        setupLoginLabel()
        setupLoginField()
        setupLineLog()
        setupPasswordLabel()
        setupPasswordField()
        setupLinePas()
        setupLogInButton()
        setupRestoreLabel()
        setupFirstLine()
        setupSecondLine()
        setupRegisterButton()
    }
    
    private func setupLogo() {
        scrollView.addSubview(logoView)
        
        logoView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -80).isActive = true
        logoView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        logoView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80).isActive = true
        logoView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        logoView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    private func setupLoginLabel() {
        scrollView.addSubview(loginLabel)
        
        loginLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 60).isActive = true
        loginLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        loginLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupLoginField() {
        scrollView.addSubview(loginTextField)
        
        loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 0).isActive = true
        loginTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        loginTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupLineLog() {
        scrollView.addSubview(logLineView)
        
        logLineView.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0).isActive = true
        logLineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        logLineView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        logLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    private func setupPasswordLabel() {
        scrollView.addSubview(passwordLabel)
        
        passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 5).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        passwordLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupPasswordField() {
        scrollView.addSubview(passwordTextField)
        
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 0).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupLinePas() {
        scrollView.addSubview(pasLineView)
        
        pasLineView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 0).isActive = true
        pasLineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        pasLineView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        pasLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    private func setupLogInButton() {
        scrollView.addSubview(logInButton)
        
        logInButton.topAnchor.constraint(equalTo: pasLineView.bottomAnchor, constant: 50).isActive = true
        logInButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        logInButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupRestoreLabel() {
        scrollView.addSubview(restoreLabel)
        
        restoreLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 150).isActive = true
        restoreLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        restoreLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        restoreLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupFirstLine() {
        scrollView.addSubview(firstLineView)
        
        firstLineView.centerYAnchor.constraint(equalTo: restoreLabel.centerYAnchor).isActive = true
        firstLineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        firstLineView.rightAnchor.constraint(equalTo: restoreLabel.leftAnchor, constant: 25).isActive = true
        firstLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    private func setupSecondLine() {
        scrollView.addSubview(secondLineView)
        
        secondLineView.centerYAnchor.constraint(equalTo: restoreLabel.centerYAnchor).isActive = true
        secondLineView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
        secondLineView.leftAnchor.constraint(equalTo: restoreLabel.rightAnchor, constant: -25).isActive = true
        secondLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    private func setupRegisterButton() {
        scrollView.addSubview(registerButton)
        
        registerButton.topAnchor.constraint(equalTo: restoreLabel.bottomAnchor, constant: 20).isActive = true
        registerButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        registerButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
