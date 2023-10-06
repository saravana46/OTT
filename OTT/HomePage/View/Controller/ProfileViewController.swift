//
//  ProfileViewController.swift
//  OTT
//
//  Created by user on 28/08/23.
//

import UIKit
import Firebase
import GoogleSignIn
import SDWebImage

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userMailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = Auth.auth().currentUser
        if currentUser != nil {
            userMailLabel.text = currentUser?.email
            userNameLabel.text = currentUser?.displayName
            print("\(String(describing: currentUser?.photoURL))")
            if let imageURL = currentUser?.photoURL {
                userProfileImage.downloadImage(url: "\(imageURL)")
            }else{
                
            }
        }else{
            
        }
    }
    
    @IBAction func logOutBtnAction(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let appDelegate = UIApplication.shared.delegate! as! AppDelegate
            appDelegate.mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            appDelegate.initialViewController = appDelegate.mainStoryboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
            appDelegate.window?.rootViewController = appDelegate.initialViewController
            appDelegate.window?.makeKeyAndVisible()
        }
        catch let signOutError as NSError {
            print("Error signing out: %@",signOutError)
        }
    }
    
}

extension UIImageView{
    func downloadImage(url:String){
      //remove space if a url contains.
        let stringWithoutWhitespace = url.replacingOccurrences(of: " ", with: "%20", options: .regularExpression)
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: URL(string: stringWithoutWhitespace), placeholderImage: UIImage())
    }
}
