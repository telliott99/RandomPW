This repository contains a simple app written in Swift4 using Xcode.  

#### RandomPW

RandomPW uses a cryptographically secure source of random bytes `SecRandomCopyBytes` [ref](https://developer.apple.com/documentation/security/randomization_services) to generate a password from a collection of characters which by default is the lowercase letters.

The possible characters may be modified to include include digits and uppercase letters, or even a custom character set.

![](screenshot.png)

