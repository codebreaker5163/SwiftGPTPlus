# SwiftGPTPlus

SwiftGPTPlus is a framework that allows you to easily integrate the OpenAI GPT-3.5 Turbo model, GPT-4 Model with 'Text To Voice' Feature into your Swift applications for natural language processing tasks.

![SWIFT](https://github.com/codebreaker5163/SwiftGPTPlus/assets/33778814/812bf1da-6afa-4dec-a63a-79bd3a871b46)


## Features

- Seamless integration with OpenAI's GPT-3.5 Turbo model.
- Easy-to-use Swift API for text generation and processing.
- Customizable parameters for generating text.
- Text to voice feature (With 30 accents)

## Installation

🚀 Getting Started with SwiftGPTPlus 📦

Integrating SwiftGPTPlus into your project is a breeze! Follow these simple steps:

📂 Drag and Drop Framework:
Add the SwiftGPTPlus.framework to your Xcode project by simply dragging and dropping it.
🚀 Embed & Sign:
Ensure seamless integration by setting the Embed option to 'Embed & Sign' for SwiftGPTPlus.framework.
That's it! You're now ready to tap into the power of SwiftGPTPlus for all your natural language processing needs. Happy coding! 🎉🚀💬


## Usage

To get started with SwiftGPTPlus, follow these simple steps:

```import SwiftGPTPPlus```

Set your ViewController/Class as delegate, as shown below:
```
class ViewController: UIViewController, SwiftGPTPlusDelegate
```

Next, create an instance for GPTController
```
gptPlus = GPTController(gptAuthKey: "<YOUR_OPEN_AI_AUTH_KEY>",gptOrgKey: "<OPTIONAL YOUR_OPEN_AI_ORG_ID>", gptModel: "<GPT Model gpt3.5-turbo is default>")
```

Enable TTS
```
var isSet = gptPlus?.enableSpeech(voice: Voice.Flo,speed: 0.6) // Check available values from Voice enum. If isSet is false, reasons may be voice not available on device, or you sent wrong value for speed (0 to 1)
        //  If you  want to disable speech
        //  gptPlus?.disableSpeech()
```

Set role for GPT:
```
gptPlus?.setGPTRole(role: "You are a maths professor!") // Set role for chatGPT
```

To send message to ChatGPT, use askAI() function (Call this function in background thread, not on main thread)
```
gptPlus?.askAI(message: message)
```

You will get response in delegate functions
```func didReceiveValidationError(error: String) ``` - If open ai auth key is missing. 
```func didReceiveError(error: Error)``` - Error from OpenAI
```
func didReceiveResponse(message: SwiftGPTPPlus.GPTChatResponse) {
        print(message.choices.first!.message.content) // Response from chatGPT
    }
``` 

## GPTChatResponse Structure
```
public struct GPTChatResponse: Codable {
    public let id: String
    public let object: String
    public let created: Int
    public let model: String
    public let choices: [Choice]
    public let usage: Usage
}

public struct Choice: Codable {
    public let index: Int
    public let message: GPTMessage
    public let finish_reason: String
}

public struct GPTMessage: Codable {
    public let role: String
    public let content: String
}

public struct Usage: Codable {
    public let prompt_tokens: Int
    public let completion_tokens: Int
    public let total_tokens: Int
}

```

## Contributing
I welcome contributions from the community. Kindly contact me to get source code of the framework.
