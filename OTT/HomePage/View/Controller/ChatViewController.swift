//
//  ChatViewController.swift
//  OTT
//
//  Created by user on 28/08/23.
//

import UIKit
import SDWebImage

class ChatViewController: UIViewController {
    
    @IBOutlet weak var userListTableView: UITableView!
    
    var homeDatas : [HomeDatas] = []
    var homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate = self
        homeViewModel.homeAPI()
    }
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath)
            as? UserListTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.userNameLabel.text = homeDatas[indexPath.row].login
        cell.userImageView.sd_setImage(with: URL(string: homeDatas[indexPath.row].avatar_url ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = UIStoryboard(name: "HomePage", bundle: .main).instantiateViewController(withIdentifier: "WebViewController")
                as? WebViewController else { return }
        controller.Name = homeDatas[indexPath.row].login ?? ""
        controller.Url = homeDatas[indexPath.row].html_url ?? ""
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ChatViewController: HomeViewModelDelegate{
    func homeLists(list: [HomeDatas]) {
        homeDatas = list
        userListTableView.reloadData()
    }
}
