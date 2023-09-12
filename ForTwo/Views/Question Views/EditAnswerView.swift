//
//  EditAnswerView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-11.
//

import SwiftUI

struct EditAnswerView: View {
    @State var questionText: String
    @State var questionNum: String
    @State var responseOne: String
    @State var responseTwo: String
    @State private var isEditing = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser, let couple = viewModel.currentCouple {
            NavigationView {
                GeometryReader { geometry in
                    ZStack {
                        Image("background")
                            .resizable()
                            .ignoresSafeArea()
                        VStack {
                            HStack {
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image("backicon2")
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(0.5)
                                    }
                                }
                                
                                Spacer()
                                Button(action: {
//                                    presentationMode.wrappedValue.dismiss()
//                                    let questionNum = questionNum ?? "0"
                                    if let unwrappedQuestionNum = Int(questionNum) {
                                        if user.id == couple.uidOne {
                                            viewModel.updateResponse(newResponse: responseOne, arrayNum: unwrappedQuestionNum, coupleId: couple.id ?? "", changeResponseOne: true)
                                        } else {
                                            viewModel.updateResponse(newResponse: responseTwo, arrayNum: unwrappedQuestionNum, coupleId: couple.id ?? "", changeResponseOne: false)
                                        }
                                    }
//                                    if user.id == couple.uidOne {
//                                        viewModel.updateResponse(newResponse: responseOne, arrayNum: Int(questionNum) - 1, coupleId: couple.id ?? "", changeResponseOne: true)
//                                    } else {
//                                        viewModel.updateResponse(newResponse: responseTwo, arrayNum: Int(questionNum) - 1, coupleId: couple.id ?? "", changeResponseOne: false)
//                                    }
//                                    viewModel.updateResponse(coupleId: <#T##String#>, changeResponseOne: )
                                }) {
                                    HStack {
                                        Image("checkicon")
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(0.5)
                                    }
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height / 12)
                            //                        .border(.red)
                            ScrollView {
                                VStack {
                                    // Question text
                                    VStack {
                                        HStack {
                                            Text(questionText)
                                                .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                .frame(width: geometry.size.width * 0.7, alignment: .leading)
                                                .border(.red)
                                        }
                                        .padding([.bottom], 5)
                                        
                                        //                                    Text("Question #" + questionNum)
                                        //                                        .frame(alignment: .trailing)
                                        //                                        .border(.red)
                                        //                                        .frame(width: geometry.size.width * 0.7, alignment: .leading)
                                        //
                                        // Question # and date last updated?
                                        Spacer()
                                        HStack {
                                            Text("Question #" + questionNum + "     Apr 16. 2023")
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .foregroundColor(Color(red: 0xa9 / 255, green: 0xa9 / 255, blue: 0xa9 / 255))
                                                .frame(width: geometry.size.width * 0.7, alignment: .leading)
                                                .border(.red)
                                        }
                                    }
                                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                    .border(.blue)
                                    
                                    Spacer()
                                    
                                    if user.id == couple.uidOne {
                                        VStack {
                                            // Name1
                                            Spacer()
                                            Text("couple.nicknameOne")
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                                .border(.red)
                                                .padding([.vertical], 4)
    //                                        Spacer()
//                                            TextField("responseOne")
//                                            TextField("test", text: self.$responseOne)
                                          TextField("Placeholder Text", text: self.$responseOne)
                                              .textFieldStyle(PlainTextFieldStyle())
                                              .font(Font.custom("HermeneusOne-Regular", size: 16))
                                              .foregroundColor(Color(red: 0x54 / 255, green: 0x54 / 255, blue: 0x54 / 255))
                                              .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                              .border(.red)
                                        }
                                        .padding([.bottom], geometry.size.height / 40)
                                    } else {
                                        VStack {
                                            // Name1
                                            Spacer()
                                            Text("couple.nicknameTwo")
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                                .border(.red)
                                                .padding([.vertical], 4)
    //                                        Spacer()
                                            Text("responseTwo")
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .foregroundColor(Color(red: 0x54 / 255, green: 0x54 / 255, blue: 0x54 / 255))
                                                .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                                .border(.red)
                                        }
                                    }
                                    
//
                                }
                                .border(.red)
                            }
                            .frame(width: geometry.size.width * 0.85)
                            .border(.red)
                            
                            HStack {

                            }
                            .border(.green)
                            .frame(width: geometry.size.width, height: geometry.size.height / 12)
                        }
                        //                    .border(.red)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    //                HStack {
                    //                    ToolbarItem(placement: .principal) {
                    //                        Text("List")
                    //                            .font(Font.custom("ZapfinoExtraLT-One", size: 44))
                    //                    }
                    //                }
                    ToolbarItem(placement: .principal) {
                        Text("ForTwo")
                            .font(Font.custom("ZapfinoExtraLT-One", size: 44))
                    }
                }
            }
        }
        
//        VStack {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//
//            Button(action: {
//                presentationMode.wrappedValue.dismiss()
//            }) {
//                HStack {
//                    Image("backicon")
//                        .resizable()
//                        .scaledToFit()
//                                    .scaleEffect(0.1)
//                }
//            }
//            .padding()
//        }
    }
}

struct EditAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        EditAnswerView(questionText: "On days with weather like today, what do you feel like cooking/eating together?", questionNum: "13", responseOne: "one", responseTwo: "two")
            .environmentObject(AuthViewModel())
    }
}
