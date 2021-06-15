//
//  ContentView.swift
//  networking-test
//
//  Created by oliver on 25.05.21.
//

import SwiftUI
import Combine
import Networking

struct ContentView: View {
    let network = NetworkingClient(baseURL: "https://jsonplaceholder.typicode.com")

    @State var cancellables = Set<AnyCancellable>()

    var body: some View {
        Text("Hello World...")
            .onAppear(perform: getSinglePost)
            .onAppear(perform: getMultiplePosts)
            .padding()
    }
    
    func getSinglePost() {
        let postsPublisher: AnyPublisher<MyPost, Error> = network.get("/posts/1")
        postsPublisher.sink(receiveCompletion: { _ in }) { (json:Any) in
            print("result postsPublisher")
            print(json)

        }.store(in: &cancellables)
    }

    func getMultiplePosts() {
        let postsPublisher: AnyPublisher<[MyPost], Error> = network.get("/posts")
        postsPublisher.sink(receiveCompletion: { _ in }) { (json:Any) in
            print("result postsPublisher multiple")
            print(json)

        }.store(in: &cancellables)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
