//
//  File.swift
//  Test
//
//  Created by naeem alabboodi on 8/18/23.
//

import Foundation
import UIKit

class FaultyViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = user!.name
    }
    
    func updateUserAge(age: Int) {
        user?.age = age
    }
    
    func fetchData() -> [String] {
        let data = try? Data(contentsOf: URL(string: "https://api.example.com/data")!)
        let result = String(data: data!, encoding: .utf8)
        return result!.components(separatedBy: ",")
    }
}
 
struct User {
    var name: String
    var age: Int
}
 
