//
//  NotificationListVC.swift
//  TechExactly
//
//  Created by Sudeepa Pal on 23/10/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class NotificationListVC: UIViewController {
    
    let tableView = UITableView()
    
    var user = Auth.auth().currentUser?.email  ?? "User Not Found"
    
    let textLbl: UILabel = {
        let txtLbl = UILabel()
        //txtLbl.text = "Welcome \(user) !"
        txtLbl.textColor = #colorLiteral(red: 0.1760970056, green: 0.5901255608, blue: 0.8185432553, alpha: 1)
        txtLbl.font = UIFont.boldSystemFont(ofSize: 20)
        return txtLbl
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        self.navigationItem.title = "Notification"
        self.navigationItem.titleView?.tintColor = .white
        let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.backgroundColor = #colorLiteral(red: 0.1760970056, green: 0.5901255608, blue: 0.8185432553, alpha: 1)
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
            navigationController?.navigationBar.standardAppearance = navigationBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
            
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backtoLogin))
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        textLbl.text = "Welcome \(user)!"
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NtifiViewTableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.hidesBackButton = true
        view.addSubview(textLbl)
        view.addSubview(tableView)
        
        
        
        setContsForTblV()
        setConstraintsForLbel()
    }
    
    private func setContsForTblV() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    private func setConstraintsForLbel() {
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            textLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            //textLbl.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            textLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            textLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
        ])
    }
    
    @objc func backtoLogin() {
        navigationController?.popToRootViewController(animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}

extension NotificationListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NtifiViewTableViewCell
        
       // cell.textLabel?.text = "Notification Title"
        cell.setConsts()
        return cell
    }
    
    
}

extension NotificationListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
