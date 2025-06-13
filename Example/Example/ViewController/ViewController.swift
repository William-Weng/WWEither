//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2025/6/13.
//

import UIKit
import WWPrint
import WWEither

// MARK: - ViewController
final class ViewController: UIViewController {

    private struct Member {
        let id: Int
        let name: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demo1()
        demo2()
        demo3()
    }
}

// MARK: - 小工具
private extension ViewController {
    
    /// 分辨是不是VIP？
    func demo1() {
        
        let vipInfo = memberInfo(isVIP: true)
        let normalInfo = memberInfo(isVIP: false)

        switch vipInfo {
        case .left(let message): wwPrint("VIP訊息: \(message)")
        case .right(let level): wwPrint("會員等級: \(level)")
        }

        switch normalInfo {
        case .left(let message): wwPrint("VIP訊息: \(message)")
        case .right(let level): wwPrint("會員等級: \(level)")
        }
    }
    
    /// 型別轉換 (數字 => 字串)：WWEither<Int, String> => WWEither<String, String>
    func demo2() {
        
        let either: WWEither<Int, String> = .left(42)
        let mapped = either.mapLeft { number in return "數字是：\(number)" }
        
        wwPrint(mapped)
    }
    
    /// 型別轉換 (會員編號 => 會員資訊)：WWEither<Int, String> => WWEither<Member, String>
    func demo3() {
        
        let memberInfo: WWEither<Int, String> = .left(123)
        let fullMemberInfo = memberInfo.mapLeft { Member(id: $0, name: "預設會員") }

        switch fullMemberInfo {
        case .left(let member): wwPrint("會員資訊：ID = \(member.id), 名稱 = \(member.name)")
        case .right(let message): wwPrint("訊息：\(message)")
        }
    }
}

// MARK: - 小工具
private extension ViewController {
    
    /// 使用示例
    /// - Parameter isVIP: 是不是VIP
    /// - Returns: WWEither<String, Int>
    func memberInfo(isVIP: Bool) -> WWEither<String, Int> {
        if isVIP { return .left("VIP會員") }
        return .right(1)
    }
}
