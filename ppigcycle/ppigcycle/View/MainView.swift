//
//  MainView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/26.
//

import SwiftUI

struct MainView: View {

    @StateObject private var vm = AppViewModel()
    @State var tag:Int? = nil
    @StateObject var restAPI = RestAPI()
    @State private var id: String = ""
    @StateObject var api = RestAPI.shared


    var body: some View {
        NavigationView {
            ZStack{
                Color(r:254, g: 251, b: 233).ignoresSafeArea()
                VStack{
                    HStack{
                        Text("분리수거 버리는 날은 ")
                            .font(.system(size: 20))
                        Text("\(restAPI.date)요일")
                            .font(.system(size: 35,weight: .bold))
                            .foregroundColor(Color.green)
                            .onAppear {
                                restAPI.fetchDate()
                            }

                    }.padding(25)
                    HStack(spacing: 15){
                        NavigationLink(destination:PaperView()//updateView(material: "종이")
                        ,tag: 2, selection: self.$tag) {}
                        Button(action: {self.tag = 2}){
                            Image("paper").renderingMode(.original)
                                .resizable()
                                .frame(width: 150, height: 120)
                        }
                        NavigationLink(destination: PlasticView()
                        ,tag: 3, selection: self.$tag) {}
                        Button(action: {self.tag = 3}){
                            Image("plastic").renderingMode(.original)
                                .resizable()
                                .frame(width: 150, height: 120)
                        }

                    }.padding()
                    HStack(spacing: 15){
                        NavigationLink(destination: GlassView()
                        ,tag: 4, selection: self.$tag) {}
                        Button(action: {self.tag = 4}){
                            Image("glass").renderingMode(.original)
                                .resizable()
                                .frame(width: 150, height: 120)
                        }
                        NavigationLink(destination: StyrofoamView()
                        ,tag: 5, selection: self.$tag) {}
                        Button(action: {self.tag = 5}){
                        Image("styrofoam").renderingMode(.original)
                                .resizable()
                                .frame(width: 150, height: 120)
                        }

                    }.padding()
                    HStack(spacing: 15){
                        NavigationLink(destination: CanView()
                        ,tag: 6, selection: self.$tag) {}
                        Button(action: {self.tag = 6}){
                            Image("can").renderingMode(.original)
                                .resizable()
                                .frame(width: 150, height: 120)
                        }
                        NavigationLink(destination: VinylView()
                        ,tag: 7, selection: self.$tag) {}
                        Button(action: {self.tag = 7}){
                            Image("vinyl").renderingMode(.original)
                                .resizable()
                                .frame(width: 150, height: 120)
                        }
                    }.padding()
                    Spacer()
                    NavigationLink(destination: ContentView()
                        .environmentObject(vm)
                        .task {
                            await vm.requestDataScannerAccessStatus()
                        }, tag: 1, selection: self.$tag) {}
                    Button(action: {
                        self.tag = 1
                        print("barcode")
                    }){
                        Image("barcode").renderingMode(.original)
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                }

            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
