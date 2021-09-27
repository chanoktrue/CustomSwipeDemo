//
//  ContentView.swift
//  CustomSwipeDemo
//
//  Created by Thongchai Subsaidee on 27/9/21.
//
//
// https://youtu.be/fQTcR7j2FSE
//

import SwiftUI

struct ContentView: View {
    
    @State private var favoriteList: [String] = []
    @State private var saveLaterList: [String] = []
    
    var body: some View {
        NavigationView {
            List {
                
                HStack {
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        
                        Label {
                            Text("Favorite")
                        } icon: {
                            Image(systemName: "heart")
                        }
                        .foregroundColor(.orange)
                        
                        Image(systemName: "\(favoriteList.count).circle.fill")
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Label {
                            Text("Save later  ")
                        } icon: {
                            Image(systemName: "clock.fill")
                        }
                        .foregroundColor(.orange)
                        
                        Image(systemName: "\(saveLaterList.count).circle.fill")
                            .font(.title)

                    }
                    
                    Spacer()
                    
                }
                
                
                ForEach(1..<11) { idx in
                    HStack {
                        Image(systemName: "\(idx).circle.fill")
                            .font(.title)
                        Text("Item #\(idx)")
                            .font(.body)
                    }
                    .foregroundColor(.blue)
                    .swipeActions(allowsFullSwipe: false) {
                                            
                        Button {
                            print("Fav item")
                            favoriteList.append("Item #\(idx)")
                        } label: {
                            Label("Favorite", systemImage: "heart")
                        }
                        .tint(.green)
                        
                        Button {
                            print("Save for later")
                            saveLaterList.append("Item #\(idx)")
                        } label: {
                            Label("Save for later", systemImage: "clock.fill")
                        }
                        .tint(.red)

                    }
                    
                    .swipeActions(edge: .leading) {
                        Button {
                            print("Fav item")
                            favoriteList.append("Item #\(idx)")
                        } label: {
                            Label("Favorite", systemImage: "heart")
                        }
                        .tint(.green)
                        
                        Button {
                            print("Save for later")
                            saveLaterList.append("Item #\(idx)")
                        } label: {
                            Label("Save for later", systemImage: "clock.fill")
                        }
                        .tint(.red)
                    }
                    
                }
            }
            .navigationTitle("Swipe with SwiftUI 3")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
