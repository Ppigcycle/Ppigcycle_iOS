import SwiftUI

struct StyrofoamView: View {
    @StateObject var restAPI = RestAPI()

    var body: some View {
        ZStack {
            Color(r:254, g: 251, b: 233).ignoresSafeArea()

            VStack {
                Text("스티로폼 분리수거 과정")
                    .bold()
                    .padding()
                    .font(.system(size: 18))

                Text(restAPI.materialResponse)

                Spacer()
            }
        }
        .onAppear {
            restAPI.fetchMaterial(material: "styrofoam")
        }
    }
}

