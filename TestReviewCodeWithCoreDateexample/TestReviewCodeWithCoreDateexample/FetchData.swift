//
//  FetchData.swift
//  Test
//
//  Created by naeem alabboodi on 8/18/23.
//

import SwiftUI

// MARK: - ArrayPostElement
struct ArrayPostElement: Codable,Identifiable {
    
    
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

class FetchDataViewModel: ObservableObject {
    @Published var arrayResult :[ArrayPostElement] = []
    
    
    init() {
        getPost()
    }
    
    func   getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {return }
            guard error == nil else {return}
            guard let response = response as? HTTPURLResponse else {
                return
            }
            guard response.statusCode >= 200 && response.statusCode < 200  else {return }
            let newDataJson = String(data: data, encoding: .utf8)
            print(newDataJson ?? "")
            let newPost = try? JSONDecoder().decode([ArrayPostElement].self, from: data)
            DispatchQueue.main.async {
                self?.arrayResult = newPost ?? []
            }
        }
        .resume()
    }
}

struct FetchData: View {
    @StateObject var result = FetchDataViewModel()
    var body: some View {
        VStack {
            List {
                ForEach(result.arrayResult) {item in
                    Text(item.name)
                }
            }
        }
    }
}

#Preview {
    FetchData()
}
