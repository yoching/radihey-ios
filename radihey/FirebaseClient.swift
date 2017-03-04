//
//  FirebaseClient.swift
//  radihey
//
//  Created by Yoshikuni Kato on 3/4/17.
//  Copyright © 2017 syamaoka. All rights reserved.
//

import Foundation
import Firebase
import ObjectMapper

final class FirebaseClient {
    
    private let ref = FIRDatabase.database().reference().child("channels")
    
    func send(reaction: VoiceStamp, to channelName: String) {
        var parameters = reaction.parametersForFirebase
        parameters["date"] = FIRServerValue.timestamp()
        ref.child(channelName).childByAutoId()
            .setValue(parameters)
    }
    
    func addReactionObserver(of channelName: String, observer: @escaping (Reaction) -> Void) {
        ref.child(channelName)
            .queryLimited(toLast: 1)
            .observe(
                .childAdded,
                with: { snapshot in
                    guard let reaction = Mapper<Reaction>().map(snapshot: snapshot) else {
                        return
                    }
                    
                    observer(reaction)
            }
        )
    }
    
}
