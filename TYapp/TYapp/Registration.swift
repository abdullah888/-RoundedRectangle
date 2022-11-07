//
//  Registration.swift
//  TYapp
//
//  Created by abdullah on 13/04/1444 AH.
//

import SwiftUI

struct Registration: View {
    @State private var startAniamtion: Bool = false
    @StateObject var Object = ObViewModel()
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.color!]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.color!]
    }
    var body: some View {
        NavigationStack {
           
                ZStack {
                    Background()
                    
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        HStack{
                            RoundedRectangle(cornerRadius: 65)
                                .fill(Material.thin)
                                .frame(width: 130,height: 130)
                                .padding(.top, 25)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
                                .overlay {
                                    VStack {
                                        Image("user")
                                            .foregroundColor(Color.gray)
                                            .clipShape(Circle())
                                            .frame(width: 100, height: 100)
                                            .padding(.top, 25)
                                    }.padding()
                                    
                                }
                                .padding()
                            Spacer()
                        }
                        
                        ScrollView{
                            VStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Material.thin)
                                .frame(width: UIScreen.main.bounds.width - 30,height: 70)
                                .padding(.top, 25)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
                                .overlay {
                                    VStack {
                                        TextField("الاسم", text: self.$Object.name)
                                            .multilineTextAlignment(TextAlignment.center)
                                            .padding(.top, 25)
                                    }.padding()
                                }
                                
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Material.thin)
                                .frame(width: UIScreen.main.bounds.width - 30,height: 70)
                                .padding(.top, 25)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)

                                .overlay {
                                    VStack {
                                        TextField("الرقم السري", text: self.$Object.name)
                                            .multilineTextAlignment(TextAlignment.center)
                                            .padding(.top, 25)
                                    }.padding()
                                }
                                
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Material.thin)
                                .frame(width: UIScreen.main.bounds.width - 30,height: 70)
                                .padding(.top, 25)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)

                                .overlay {
                                    VStack {
                                        TextField("تاكيد الرقم السري", text: self.$Object.name)
                                            .multilineTextAlignment(TextAlignment.center)
                                            .padding(.top, 25)
                                    }.padding()
                                }
                               
                            
                            
                            
                              
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Material.thin)
                                    .frame(width: 190, height: 80)
                                    .background(Color.black).opacity(0.1)
                                    .shadow(color: Color("Color").opacity(0.89), radius: 10, x: 10, y: 10)
                                    .cornerRadius(18)
                                    .overlay {
                                        VStack {
                                            Button {
                                                
                                            } label: {
                                                Text("OK")
                                                    .bold()
                                                    .font(.title)
                                                    .foregroundColor(.white)
                                            }

                                        }.padding()
                                    }
                                    .padding()
                            }
                        }
                        
                        
                            
                    }
                }.navigationTitle("صفحة التسجيل")
                .onAppear {
                    self.startAniamtion.toggle()
                }
            }
        
    }
    
    @ViewBuilder func Background() -> some View {
        TimelineView(.animation(minimumInterval: 6.6, paused: false)) { _ in
            
            Canvas { context, size in
                context.addFilter(.blur(radius: 10))
                context.drawLayer { gc in
                    for index in 0...4 {
                        if let resolvedView = context.resolveSymbol(id: index) {
                            gc.draw(resolvedView, at: CGPoint(x: size.width / 2, y: size.height / 2))
                        }
                    }
                }
            } symbols: {
                
                BackgroundCircle(offset: startAniamtion ? CGSize(width: .random(in: -180...180), height: .random(in: -240...240)) : .zero, color: .blue, frame: 75)
                    .tag(1)
                    

                BackgroundCircle(offset: startAniamtion ? CGSize(width: .random(in: -180...180), height: .random(in: -240...240)) : .zero, color: .orange, frame: 130)
                    .tag(2)

                BackgroundCircle(offset: startAniamtion ? CGSize(width: .random(in: -180...180), height: .random(in: -240...240)) : .zero, color: .pink, frame: 200)
                    .tag(3)
                    
                BackgroundCircle(offset: startAniamtion ? CGSize(width: .random(in: -180...180), height: .random(in: -240...240)) : .zero, color: .green, frame: 200)
                    .tag(4)

            }
        }
    }
    
    @ViewBuilder func BackgroundCircle(offset: CGSize = .zero, color: Color, frame: CGFloat) -> some View {
        Circle()
            .fill(color)
            .shadow(color: .black.opacity(1), radius: 10, x: 10, y: 10)
            .frame(width: frame, height: frame)
            .offset(offset)
            .animation(.easeInOut(duration: 7), value: offset)
    }
}


extension UIColor {
    static let color = UIColor(named: "Color")
}
