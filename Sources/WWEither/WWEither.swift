//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/9/21.
//

import Foundation

// MARK: - 模仿Rust的Either功能 (二選一)
public enum WWEither<L, R> {
    
    case left(L)
    case right(R)
}

// MARK: - 取值方法
public extension WWEither {
    
    var leftValue: L? {
        switch self {
        case .left(let value): return value
        case .right(_): return nil
        }
    }
    
    var rightValue: R? {
        switch self {
        case .right(let value): return value
        case .left(_): return nil
        }
    }
}

// MARK: - 映射方法 (轉換屬性)
public extension WWEither {
    
    /// 映射左側值
    /// - Parameter transform: (L) -> T
    /// - Returns: WWEither<T, R>
    func mapLeft<T>(_ transform: (L) -> T) -> WWEither<T, R> {
        switch self {
        case .right(let value): return .right(value)
        case .left(let value): return .left(transform(value))
        }
    }
    
    /// 映射右側值
    /// - Parameter transform: (R) -> T
    /// - Returns: WWEither<L, T
    func mapRight<T>(_ transform: (R) -> T) -> WWEither<L, T> {
        switch self {
        case .left(let value): return .left(value)
        case .right(let value): return .right(transform(value))
        }
    }
}
