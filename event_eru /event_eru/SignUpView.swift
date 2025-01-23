//
//  SignUpView.swift
//  event_eru
//
//  Created by şeyma gizem sivri on 20.12.2024.


import SwiftUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false

    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Image("images")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                }
                .padding(.top, 40)

                VStack(spacing: 20) {
                    VStack {
                        TextField("Adınız", text: $firstName)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.bottom, 10)

                        TextField("Soyadınız", text: $lastName)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.bottom, 10)

                        TextField("E-posta", text: $email)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .keyboardType(.emailAddress)
                            .padding(.bottom, 10)

                        VStack {
                            HStack {
                                if isPasswordVisible {
                                    TextField("Şifre", text: $password)
                                        .padding()
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(10)
                                        .padding(.bottom, 10)
                                } else {
                                    SecureField("Şifre", text: $password)
                                        .padding()
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(10)
                                        .padding(.bottom, 10)
                                }

                                Button(action: {
                                    isPasswordVisible.toggle()
                                }) {
                                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)

                    Button(action: {
                        print("Kayıt Olundu")
                    }) {
                        Text("Kayıt Ol")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top, 20)
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top, 30)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal, 20)

                Spacer()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
