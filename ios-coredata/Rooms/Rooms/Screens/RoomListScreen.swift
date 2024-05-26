//
//  ContentView.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import SwiftUI

struct RoomListScreen: View {

    @StateObject
    private var viewModel = RoomListViewModel()

    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {

            VStack {
                List(viewModel.rooms, id: \.id) { room in
                    HStack {
                        Text(room.name)

                        Spacer()

                        HStack {

                        }
                        .frame(width: 50, height: 50)
                        .background(room.color)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("All Rooms")
                .navigationBarItems(trailing: Button("Add New Room") {
                    isPresented = true
                })
                .onAppear(perform: {
                    viewModel.getAllRooms()
                })
                .sheet(isPresented: $isPresented, onDismiss: {
                    viewModel.getAllRooms()
                } ,content: {
                    AddRoomScreen()
                })

                Button("Delete all Rooms") {
                    viewModel.deleteAllRooms()
                    viewModel.getAllRooms()
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(.red)
            }
        }
    }
}

struct RoomListScreen_Previews: PreviewProvider {
    static var previews: some View {
        RoomListScreen()
    }
}
