//
//  main.swift
//  프로그래머스_단어 변환
//
//  Created by 김병엽 on 2023/11/03.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    if !words.contains(target) {
        return 0
    }
    
    // BFS
    var visited = Array(repeating: false, count: words.count)
    var queue: [(begin: String, cnt: Int)] = []
    
    queue.append((begin, 0))
    
    while (!queue.isEmpty) {
        
        let here = queue.removeFirst()
        if here.begin == target {
            return here.cnt
        }
        
        for (idx, word) in words.enumerated() {
            if !visited[idx] && isDifference(here.begin, word) {
                queue.append((word, here.cnt + 1))
                visited[idx] = true
            }
        }
    }
    
    return 0
}

func isDifference(_ begin: String, _ next: String) -> Bool {
    
    let a = Array(begin)
    let b = Array(next)
    
    var cnt = 0
    
    for i in 0..<a.count {
        if a[i] != b[i] {
            cnt += 1
            if cnt > 1 {
                return false
            }
        }
    }
    
    if cnt == 1 {
        return true
    }
    
    return false
}
