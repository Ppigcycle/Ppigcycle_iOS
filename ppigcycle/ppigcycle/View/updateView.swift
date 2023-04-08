////
////  updateIView.swift
////  ppigcycle
////
////  Created by 왕서희 on 2023/03/30.
////
//
//import SwiftUI
//
//struct updateView(material:String):View {
//    var body: some View {
//
//        @StateObject var meterial = RestAPI()
//
//            // meterial 종류에 따라 view를 업데이트
//            switch material {
//            case "비닐":
//                meterial.fetchMaterial(meterial: "비닐")
//            case "종이":
//                meterial.fetchMaterial(meterial: "종이")
//            case "캔":
//                meterial.fetchMaterial(meterial: "캔")
//            case "스티로폼":
//                meterial.fetchMaterial(meterial: "스티로폼")
//            case "플라스틱":
//                meterial.fetchMaterial(meterial: "플라스틱")
//            case "유리":
//                meterial.fetchMaterial(meterial: "유리")
//            default:
//                break
//            }
//
//    }
//}
//
////struct updateView1(material:String?)Vi {
////    @StateObject var meterial = RestAPI()
////
////    // meterial 종류에 따라 view를 업데이트
////    switch material {
////    case "비닐":
////        meterial.fetchMaterial(meterial: "비닐")
////    case "종이":
////        meterial.fetchMaterial(meterial: "종이")
////    case "캔":
////        meterial.fetchMaterial(meterial: "캔")
////    case "스티로폼":
////        meterial.fetchMaterial(meterial: "스티로폼")
////    case "플라스틱":
////        meterial.fetchMaterial(meterial: "플라스틱")
////    case "유리":
////        meterial.fetchMaterial(meterial: "유리")
////    default:
////        break
////    }
////}
