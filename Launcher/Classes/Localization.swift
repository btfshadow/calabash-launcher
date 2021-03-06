import CommandsCore

class Localization {
    let applicationStateHandler = ApplicationStateHandler()
    
    func changeDefaultLocale(language: String) {
        var locale = "en"
        var willRun = true
        let titleLanguage = Language(rawValue: language)
        switch titleLanguage {
        case .english?:
            locale = Language.english.identifier
        case .german?:
            locale = Language.german.identifier
        case .russian?:
            locale = Language.russian.identifier
        case .italian?:
            locale = Language.italian.identifier
        case .french?:
            locale = Language.french.identifier
        case .polish?:
            locale = Language.polish.identifier
        case .other?:
            willRun = false
        default:
            print("Unknown language")
        }
        
        if willRun {
            changeLocale(locale: locale)
        }
    }
    
    func changeLocale(locale : String) {
        if let simUDID = applicationStateHandler.phoneUDID {
            let arguments = [simUDID, locale]
            CommandExecutor(launchPath: Constants.FilePaths.Bash.changeLanguage ?? "", arguments: arguments).execute()
        }
    }
}
