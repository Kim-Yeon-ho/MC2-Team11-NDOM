import SwiftUI

struct RegisterGender: View {
    @State var isLinkActive = false
    @EnvironmentObject var catInfo: GilCatDataManager
    @State var genderChoice: GilCatPicker.Choice = .first
    @State var TNRChoice: GilCatPicker.Choice = .first
    @State var isFirstClick: Bool = true
    @State var isShowingTNRPick: Bool = false
    let genderFirstChoice = "수컷"
    let genderSecondChoice = "암컷"
    let TNRFirstChoice = "⭕️"
    let TNRSecondChoice = "❌"
    
    init() {
        Theme.navigationBarColors(background: .systemFill, titleColor: .white)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea(.all)
            
            VStack {
                // 성별 피커
                HStack {
                    GilCatTitle(titleText: "성별").padding([.top, .leading])
                    Spacer()
                }
                GilCatPicker(isClick: $genderChoice, firstSelect: genderFirstChoice, secondSelect: genderSecondChoice)
                // 중성화 여부 피커
                // 다음 버튼을 처음 누르고 난 뒤 페이드인 효과로 중성화 피커 나오게 함
                if isShowingTNRPick {
                    HStack {
                        GilCatTitle(titleText: "중성화 여부").padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
                        Spacer()
                    }.transition(.opacity)
                    GilCatPicker(isClick: $TNRChoice, firstSelect: TNRFirstChoice, secondSelect: TNRSecondChoice).transition(.opacity)
                }
                Spacer()
                NavigationLink(destination: RegisterAge(), isActive: $isLinkActive) {
                    Button {
                        // 어떤게 클릭됐는지에 따라 값 줘야함
//                        if genderChoice == .first {
//                            catInfo.infoList[catInfo.infoList.endIndex-1].gender = genderFirstChoice
//                        } else {
//                            catInfo.infoList[catInfo.infoList.endIndex-1].gender = genderSecondChoice
//                        }
//                        if TNRChoice == .first {
//                            catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].neutralized = TNRFirstChoice
//                        } else {
//                            catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].neutralized = TNRSecondChoice
//                        }
                        isLinkActive = true
                    } label: {
                        GilCatMainButton(text: "다음", foreground: Color.white, background: .buttonColor)
                    }
                    .padding()
                }
                .isDetailLink(false)
            }
        }
        .navigationTitle("성별 및 중성화")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .navigationViewStyle(.stack)
                // MARK: 툴바 수정
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                            .onTapGesture {
//                                self.presentation.wrappedValue.dismiss()
                            }
                    }
                }
        .onAppear {
            // 뒤로가기로 돌아왔다면 기존에 입력했던 정보를 받아오기
            if !catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].isUploadedToServer {
                if catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].gender != nil {
//                    if genderFirstChoice == catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].gender {
//                        genderChoice = .first
//                    } else {
//                        genderChoice = .second
//                    }
                }
                if catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].neutralized != nil {
//                    if TNRFirstChoice == catInfo.gilCatInfos[catInfo.gilCatInfos.endIndex-1].neutralized {
//                        TNRChoice = .first
//                    } else {
//                        TNRChoice = .second
//                    }
                }
            }
        }
    }
}
struct RegisterGender_Previews: PreviewProvider {
    static var previews: some View {
        RegisterGender().environmentObject(GilCatDataManager().self)
    }
}
