//
//  GlassView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/26.
//
import SwiftUI

struct GlassView: View {
    @StateObject var restAPI = RestAPI()

    var body: some View {
        ZStack {
            Color(r:254, g: 251, b: 233).ignoresSafeArea()

            VStack {
                Text("유리 분리수거 과정")
                    .bold()
                    .padding()
                    .font(.system(size: 18))

                Text(restAPI.materialResponse)

                Spacer()
            }
        }
        .onAppear {
            restAPI.fetchMaterial(material: "glass")
        }
    }
}
