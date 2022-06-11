//
//  register1.swift
//  GilCat
//
//  Created by 김연호 on 2022/06/07.
//

import SwiftUI

struct Register1: View {
    @State var isLinkActive = false
    // 고양이 객체 생성
    @EnvironmentObject var catInfo: CatInfoList
    var body: some View {
        // NavigationView로 연결한거는 추후 다른 방식으로 바꿀 예정
        NavigationView {
            VStack(alignment: .leading) {
                CustomTitle(titleText: "나만의 길고양이 기록장을 만들어보세요!")
                VStack {
                    getProcessContentView(order: 1, text: "공유 코드가 있다면 알려주세요!")
                    getProcessContentView(order: 2, text: "길냥이 프로필을 적아주세요!")
                    getProcessContentView(order: 3, text: "나만의 길냥이를 만들어주세요!")
                }
                .padding()
                Spacer()
                NavigationLink(destination: Register2(), isActive: $isLinkActive) {
                    Button {
                        isLinkActive = true
                        catInfo.infoList.append(CatInfo())
                    } label: {
                        CustomMainButton(text: "시작하기", foreground: Color.white, background: .buttonColor)
                    }
                    .padding()
                }
            }
            .background(Color.backgroundColor)
        }
    }
    
    // 목차 뷰 반환하기
    func getProcessContentView(order: Int, text: String) -> some View {
        return HStack {
            Text(String(order))
                .frame(width: 30, height: 30)
                .foregroundColor(Color.black)
                .background(Color.buttonColor)
                .cornerRadius(10)
            Text(text)
                .foregroundColor(Color.white)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.pickerColor)
        .cornerRadius(20)
    }
}

struct Register1_Previews: PreviewProvider {
    static var previews: some View {
        Register1()
    }
}
