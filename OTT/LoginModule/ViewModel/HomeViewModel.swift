//
//  HomeViewModel.swift
//  OTT
//
//  Created by user on 28/08/23.
//

import UIKit
import Alamofire

protocol HomeViewModelDelegate: class{
    func homeLists(list: [HomeDatas])
}

class HomeViewModel {
    
    var delegate : HomeViewModelDelegate?
    
}

extension HomeViewModel {
    
    func homeAPI(){
        AF.request(URL(string: "https://api.github.com/users")!, method: .get, parameters: ["per_page":"30"],headers:[:]).response { results in
            if results.response != nil {
                if let data = results.data
                {
                    let machineData = try! JSONDecoder().decode([HomeDatas].self, from: data)
                    print("Yes machineAPi \(machineData)")
                    self.delegate?.homeLists(list: machineData)
                }
            } else if results.error != nil {
                print("Error From machineAPimachineAPimachineAPi")
            }
        }
    }
    
}
