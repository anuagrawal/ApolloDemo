//
//  Apollo.swift
//  ApolloDemo
//
//  Created by piyush gupta on 26/07/21.
//

import Foundation
import Apollo

class Network{
    static let shared = Network()
    
    lazy var apollo = ApolloClient(url: URL(string:"https://countries.trevorblades.com/")!)
    
}
