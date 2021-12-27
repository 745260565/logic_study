//
//  KGuessYouLikeModel.swift
//  SwiftDemo
//
//  Created by ChengHao on 2021/6/21.
//

import Foundation
import HandyJSON

struct KGuessYouLikeModel: HandyJSON {
    var albumId: Int = 0
    var categoryId: Int = 0
    var commentsCount: Int = 0
    var infoType: String?
    var isDraft: Bool = false
    var isFinished: Int = 0
    var isPaid: Bool = false
    var isVipFree: Bool = false
    var lastUptrackAt: Int = 0
    var materialType: String?
    var nickname: String?
    var pic: String?
    var playsCount: Int = 0
    var resSrc: String?
    var recTrack: String?
    var refunSupportType: Int = 0
    var subtitle: String?
    var title: String?
    var tracksCount: Int = 0
    var vipFreeType:Int = 0
    
    
    var coverMiddle: String?
    var recReason: String?
    var tracks: Int = 0
    var playsCounts: Int = 0
    
    
}
