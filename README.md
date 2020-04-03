# TextRecognition
iOS app for text recognition. 

To run the project have to install Pod file.

The application is using TesseractOCRiOS for text recognision. To detect single string better would be SwiftOCR, but it doesn't have support for Swift 5.0 yet (which was required).

To take a picture tap on camera button in left top corner. Then when picture is loaded using "Recorgnize" button you can display text in UITextView.

When the text is loaded user has posibilities of save (picture and text). Picture is save in app directory and URL with text string in UserDefaults.

History button open ViewController which display UITableView with begining of text string in cell. 
