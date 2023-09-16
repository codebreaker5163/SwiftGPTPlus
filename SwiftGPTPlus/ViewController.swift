//
//  ViewController.swift
//  SwiftGPTPlus
//
//  Created by Himanshu Sharma on 16/09/23.
//

import UIKit
import SwiftGPTPPlus
class ViewController: UIViewController, SwiftGPTPlusDelegate {
    private var gptPlus: GPTController?
    
    func didReceiveResponse(message: SwiftGPTPPlus.GPTChatResponse) {
        print(message.choices.first!.message.content) // Response from chatGPT
    }
    
    func didReceiveError(error: Error) {
        // Received Error From Open AI
        print(error.localizedDescription)
    }
    
    func didReceiveValidationError(error: String) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gptPlus = GPTController(gptAuthKey: "<YOUR_OPEN_AI_AUTH_KEY>",gptOrgKey: "<OPTIONAL YOUR_OPEN_AI_ORG_ID>", gptModel: "<GPT Model gpt3.5-turbo is default>")
        gptPlus?.delegate = self
        var isSet = gptPlus?.enableSpeech(voice: Voice.Flo,speed: 0.6) // Check available values from Voice enum. If isSet is false, reasons may be voice not available on device, or you sent wrong value for speed (0 to 1)
        //  If you  want to disable speech
        //  gptPlus?.disableSpeech()
        gptPlus?.setGPTRole(role: "You are a maths professor!") // Set role for chatGPT
        self.performSelector(inBackground: #selector(askAI), with: "What is 12 multiply by 12")
        
        
    }
    
    @objc private func askAI(message:String){
        gptPlus?.askAI(message: message)
    }

}

