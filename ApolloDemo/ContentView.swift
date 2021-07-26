//
//  ContentView.swift
//  ApolloDemo
//
//  Created by piyush gupta on 26/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var country = ""

    var body: some View {
        NavigationView{
            VStack{
                
        Text(country).onAppear(perform: {
            Network.shared.apollo.fetch(query: SpecificCountryQuery()) {result in
                switch result{
                case .success(let graphQLResult):
                    DispatchQueue.main.async {
                        if let country = graphQLResult.data?.country{
                            self.country = "Country Name: \(country.name) \n Country Flag: \(country.emoji)"
                        }
                    }
                case .failure(let error):
                    print("Error:\(error)")
                }
            }
        })
        

            }.navigationBarTitle("Country")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
