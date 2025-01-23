//
//  ContentView.swift
//  eru_etkinlik
//
//  Created by şeyma gizem sivri on 30.10.2024.
//


import SwiftUI

struct ContentView: View {
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 4.0, on: .main, in: .common).autoconnect()
    let imageWidth: CGFloat = UIScreen.main.bounds.width - 20
    let imageHeight: CGFloat = 350

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack {
                        Color(#colorLiteral(red: 0.764, green: 0.439, blue: 0.011, alpha: 1)) // #c37003
                            .frame(height: 80)
                            .ignoresSafeArea(edges: .top)

                        HStack {
                            Image("images")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding(.trailing, 8)

                            Spacer()

                            Text("ERÜ Etkinlik")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 10)

                            Spacer()

                            Menu {
                                Button("Ayarlar", action: {})
                                Button("Kulüpler", action: {})
                                Button("Çekiliş", action: {})
                                Button("Etkinlikler", action: {})
                                Button("Giriş", action: {})
                            } label: {
                                Image(systemName: "line.horizontal.3")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 10)
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer().frame(height: 10)

                    // Ana içerik alanı
                    TabView(selection: $currentIndex) {
                        ForEach(TripCards) { card in
                            Image(card.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: imageWidth, height: imageHeight)
                                .tag(TripCards.firstIndex(of: card) ?? 0)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: imageHeight)
                    .onReceive(timer) { _ in
                        currentIndex = (currentIndex + 1) % TripCards.count
                    }

                    // Semboller HStack
                  HStack(spacing: 10) {

                      // Tüm Etkinlikler
                      NavigationLink(destination: EventListView()) {
                          VStack {
                              Image(systemName: "calendar")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 70, height: 40)
                              Text("Etkinlikler")
                                  .font(.caption)
                          }
                          .padding()
                                 .foregroundColor(.black)
                      }

                      // Çekiliş
                      NavigationLink(destination: DrawView()) {
                          VStack {
                              Image(systemName: "ticket")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 50, height: 50)
                              Text("Çekiliş")
                                  .font(.caption)
                          }
                          .padding()
                                 .foregroundColor(.black)
                      }

                      // Giriş
                      NavigationLink(destination: LoginView()) {
                          VStack {
                              Image(systemName: "arrow.right.circle")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 50, height: 50)
                              Text("Giriş")
                                  .font(.caption)
                          }
                          .padding()
                                 .foregroundColor(.black)
                      }

                      // Kayıt Ol
                      NavigationLink(destination: SignUpView()) {  
                          VStack {
                              Image(systemName: "person.crop.circle.fill.badge.plus")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 50, height: 50)
                              Text("Kayıt Ol")
                                  .font(.caption)
                          }
                          .padding()
                                 .foregroundColor(.black)
                      }

                  }
                  .padding(.horizontal)
                  .padding(.top, 20)
                  .frame(maxWidth: .infinity)
                  .multilineTextAlignment(.center)


                    HStack {
                        Text("Biz Kimiz ?")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 40)
                            .padding(.leading, 20)

                        Spacer()
                    }

                    Text("ERÜ Etkinlik, öğrencilerin ve etkinliklere ilgi duyan herkes için bilgiye hızlı ve kolay bir erişim sunan yenilikçi bir platformdur. Uygulama, kullanıcılarına güncel etkinlikleri keşfetme, katılmak istedikleri organizasyonları planlama ve kulüpler hakkında kapsamlı bilgi edinme imkanı tanır. Bu sayede, her birey sosyal hayatını zenginleştirirken, etkinlikleri takip etme konusunda da büyük bir kolaylık sağlar. ERÜ Etkinlik ile etkinliklerin tadını çıkarın ve kampüs yaşamınızı dolu dolu yaşayın!")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .foregroundColor(.gray)

                    // Footer bilgisi
                    VStack(alignment: .leading) {
                        Text("Erciyes Üniversitesi, Melikgazi/Kayseri")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .padding(.bottom, 2)

                        Text("Telefon: +90 352 207 66 66")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .padding(.bottom, 2)

                        Text("E-posta: info@erciyes.edu.tr")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .padding(.bottom, 2)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 25, leading: 20, bottom: 15, trailing: 20))
                    .background(Color(#colorLiteral(red: 0.764, green: 0.439, blue: 0.011, alpha: 1)))
                }
                .background(Color(#colorLiteral(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
// Placeholder Views for NavigationLink destinations
struct EventListView: View {
    @State private var selectedFilter = "Tüm Etkinlikler"
    @State private var showFilterOptions = false

    let filters = ["Tüm Etkinlikler", "Eğitim", "Fuar", "Konser", "Sinema", "Kongre"]

    var filteredCards: [TripCard] {
        if selectedFilter == "Tüm Etkinlikler" {
            return TripCards
        } else {
            return TripCards.filter { $0.type == selectedFilter }
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {

                Text("Tüm Etkinlikler")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                VStack(alignment: .leading) {
                    Text("Filtrele")
                        .font(.headline)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(filters, id: \.self) { filter in
                                Button(action: {
                                    selectedFilter = filter
                                    print("Seçilen filtre: \(filter)")
                                }) {
                                    Text(filter)
                                        .font(.subheadline)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 15)
                                        .background(selectedFilter == filter ? Color.blue : Color.gray.opacity(0.2))
                                        .foregroundColor(selectedFilter == filter ? .white : .black)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }
                }

                ForEach(filteredCards) { card in
                    Image(card.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .clipped()
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
    }
}
struct DrawView: View {
    @State private var selectedCard: TripCard? = nil
    @State private var showForm = false
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var rating: Int = 3
    @State private var showThankYouAlert = false

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {

                Text("Çekiliş")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Kampüs etkinliklerine katılarak sürpriz ödülleri kazan!\nKatıldığın etkinliği aşağıdan seçerek lütfen formu doldurun. İyi Şanslar ✨")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)

                Divider().padding(.vertical, 10)

                VStack(alignment: .leading, spacing: 20) {
                    ForEach(TripCards) { card in
                        Button(action: {
                            selectedCard = card
                            showForm = true
                        }) {
                            HStack {
                                Image(systemName: "ticket.fill")
                                    .foregroundColor(.orange)
                                    .font(.headline)

                                Text(card.subTitle)
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $showForm) {
            formView
        }
        .alert("Katılımınız için teşekkür ederiz!", isPresented: $showThankYouAlert) {
            Button("OK", role: .cancel) {}
        }
    }

    var formView: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Formu Doldurun")
                .font(.headline)
                .padding(.bottom, 10)

            TextField("İsim", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Soyisim", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Telefon Numarası", text: $phoneNumber)
                .keyboardType(.phonePad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            VStack {
                Text("Etkinliği Puanla")
                Picker("Rating", selection: $rating) {
                    ForEach(1..<6) { num in
                        Text("\(num) ⭐️").tag(num)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Button(action: {
                print("İsim: \(firstName)")
                print("Soyisim: \(lastName)")
                print("Telefon: \(phoneNumber)")
                print("Etkinlik Puanı: \(rating)")

                showForm = false
                showThankYouAlert = true
            }) {
                Text("Gönder")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
    }
}


// Giriş Sayfası View
struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.937, green: 0.937, blue: 0.937, alpha: 1))
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image("images")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)

                Text("Giriş Ekranı")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                TextField("E-posta Adresi", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)

                SecureField("Şifre", text: $password)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)

                Button(action: {
                    print("Email: \(email), Şifre: \(password)")
                }) {
                    Text("Giriş Yap")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
