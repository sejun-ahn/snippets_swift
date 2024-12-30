import Foundation

func getDirectoryURL(newDirectoryName: String) -> URL{
    let fileManger = FileManager.default
    let documentDirectoryURL = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first!
    let newDirectoryURL = documentDirectoryURL.absoluteURL.appending(path: newDirectoryName)
    if !fileManger.fileExists(atPath: newDirectoryURL.path) {
        do {
            try fileManger.createDirectory(at: newDirectoryURL, withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            print("error: \(error)")
        }
    }
    return newDirectoryURL
}

func getDocumentDirectoryURL() -> URL{
    let fileManager = FileManager.default
    let documentDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    return documentDirectoryURL
}