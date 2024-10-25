//
//  ViewController.swift
//  TechExactly
//
//  Created by Sudeepa Pal on 23/10/24.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    private let aBackView: UIView = {
        let aView = UIView()
        aView.backgroundColor = #colorLiteral(red: 0.1760970056, green: 0.5901255608, blue: 0.8185432553, alpha: 1)
        aView.translatesAutoresizingMaskIntoConstraints = false
        return aView
    }()
    

    private let loginLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    private let imageVie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "login_icon")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        
            textField.attributedPlaceholder = NSAttributedString(
                string: "Email",
                attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1760970056, green: 0.5901255608, blue: 0.8185432553, alpha: 1)]
            )
        
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
            textField.leftView = paddingView
            textField.leftViewMode = .always
        
        
            textField.layer.borderColor = #colorLiteral(red: 0.1760970056, green: 0.5901255608, blue: 0.8185432553, alpha: 1).cgColor
            textField.layer.borderWidth = 1.0
            textField.layer.cornerRadius = 8.0

            textField.borderStyle = .none
            textField.autocapitalizationType = .none
           
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
            textField.attributedPlaceholder = NSAttributedString(
                string: "Password",
                attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1760970056, green: 0.5901255608, blue: 0.8185432553, alpha: 1)]
            )
        
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
            textField.leftView = paddingView
            textField.leftViewMode = .always
        
        textField.layer.borderColor = #colorLiteral(red: 0.1760970056, green: 0.5901255608, blue: 0.8185432553, alpha: 1).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0

        textField.borderStyle = .none
        textField.autocapitalizationType = .none
        
        
        return textField
    }()
    
    
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.6705882353, blue: 0, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationBar.isHidden = true
//    }
    
    func setupUI() {
        
        
        view.addSubview(aBackView)
        aBackView.addSubview(loginLbl)
        aBackView.addSubview(imageVie)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(errorLabel)
        
        
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 300),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            errorLabel.widthAnchor.constraint(equalToConstant: 300),
            
            aBackView.topAnchor.constraint(equalTo: view.topAnchor),
            aBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aBackView.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -15),
            
            
            loginLbl.topAnchor.constraint(equalTo: aBackView.safeAreaLayoutGuide.topAnchor, constant: 10),
            loginLbl.leadingAnchor.constraint(equalTo: aBackView.leadingAnchor, constant: 30),
            
            imageVie.topAnchor.constraint(equalTo: aBackView.safeAreaLayoutGuide.topAnchor, constant: 7),
            imageVie.trailingAnchor.constraint(equalTo: aBackView.trailingAnchor, constant: -20),
            imageVie.widthAnchor.constraint(equalToConstant: 60),
            imageVie.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
    @objc func loginTapped() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            errorLabel.text = "Please fill in all fields."
            return
        }
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                count = count + 1
                print("The Count is", count)
                //self.errorLabel.text = "Login Error: \(error.localizedDescription)"
               // AlertManager.showAlert(title: "Failed", message: error.localizedDescription, in: self)
                if count == 3 {
                    AlertManager.showAlert(title: "Blocked", message: "You Are Blocked from The App", in: self)
                    loginButton.isEnabled = false
                    loginButton.backgroundColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                    
                } else
                {
                    AlertManager.showAlert(title: "Failed", message: error.localizedDescription, in: self)
                }
            } else {
                self.errorLabel.text = "Login successful!"
                self.navigateToHomeScreen()
                self.errorLabel.text = ""
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                count = 0
            }
        }
    }
    
    
    func navigateToHomeScreen() {
        let homeVC = NotificationListVC()
        navigationItem.hidesBackButton = true
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    
   
}
