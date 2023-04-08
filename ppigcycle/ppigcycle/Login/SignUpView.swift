//
//  SignUpView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/26.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presention
    @State private var id: String = ""
    @State private var nickname: String = ""
    @State private var password: String = ""
    @State private var checkpassword: String = ""
    @State private var date: String = ""
    @StateObject var api = RestAPI()
    
    var body: some View {
        ZStack {
            Color(r:254, g: 251, b: 233).ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    TextField("아이디", text: $id)
                        .padding()
                        .autocapitalization(.none) // 자동으로 대문자 설정 안하기
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .disableAutocorrection(true) // 자동완성 끄기
                    Spacer()
                    Button(action: {
                        // api 연결
                    }) {
                        Text("중복 확인")
                            .bold()
                    }
                    .frame(width: 80, height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    .font(.system(size: 15))
                    .foregroundColor(Color.white)
                    
                }
                .padding(10)
                HStack {
                    Spacer()
                    TextField("닉네임", text: $nickname)
                        .padding()
                        .autocapitalization(.none) // 자동으로 대문자 설정 안하기
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .disableAutocorrection(true) // 자동완성 끄기
                    Spacer()
                    Button(action: {
                        // api 연결
                    }) {
                        Text("중복 확인")
                            .bold()
                    }
                    .frame(width: 80, height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    .font(.system(size: 15))
                    .foregroundColor(Color.white)
                }
                .padding(10)
                HStack {
                    Spacer()
                    SecureField("비밀번호", text: $password)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(10)
                HStack {
                    Spacer()
                    SecureField("비밀번호 확인", text: $checkpassword)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(10)
                HStack {
                    Spacer()
                    TextField("분리수거하는 요일", text: $date)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .disableAutocorrection(true) // 자동완성 끄기 
                    Spacer()
                }
                .padding(10)
                HStack {
                    Button(action: {
                        presention.wrappedValue.dismiss()
                    }) {
                        Text("뒤로가기")
                            .bold()
                    }
                    .frame(width: 100, height: 35)
                    .background(RoundedRectangle(cornerRadius: 40).fill(Color.green))
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    
                    Button(action: {
                        if id != "" && password != "" && checkpassword != "" && nickname != "" && date != "" {
                            let parameters: [String: Any] = ["id": id, "password": password, "checkpassword": checkpassword, "nickname": nickname, "date": date]
                            api.Signup(parameters: parameters)
                            
                            // api 보냈으니까 text 비워주기
                            id = ""
                            password = ""
                            checkpassword = ""
                            nickname = ""
                            date = ""
                            presention.wrappedValue.dismiss()
                        } else {
                            presention.wrappedValue.dismiss()
                        }
                    }) {
                        Text("가입하기")
                            .bold()
                    }
                    .frame(width: 100, height: 35)
                    .background(RoundedRectangle(cornerRadius: 40).fill(Color.green))
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                }
            }
        }
    }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
