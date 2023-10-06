//
//  ViewController.swift
//  OTT
//
//  Created by user on 27/08/23.
//

import UIKit
import GoogleSignIn
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var googleSignInBtn: GIDSignInButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func googleLoginBtn(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: view.getRootViewController()) { signResult, error in
            
            guard let user = signResult?.user,
            let idToken = user.idToken else { return }
            
            let accessToken = user.accessToken
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    
                    return
                }
                print(user.profile?.name ?? "")
                print(user.profile?.email ?? "")
                print(user.profile?.imageURL(withDimension: 1000) as Any)
                let appDelegate = UIApplication.shared.delegate! as! AppDelegate
                let navigationController = UINavigationController(rootViewController: TabbarController())
                navigationController.isNavigationBarHidden = true
                appDelegate.window?.rootViewController = navigationController
                appDelegate.window?.makeKeyAndVisible()
            }
            
        }
    }
    func getData(from url:URL, completion: @escaping(Data?,URLResponse?,Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}

extension UIView {
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
