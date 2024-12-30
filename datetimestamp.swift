import Foundation

/*
    get_current_timestamp
    get_current_datetime_display
    get_current_datetime_title

    convert_datetime_display_to_timestamp
    convert_timestamp_to_datetime_display
    convert_datetime_title_to_timestamp
    convert_timestamp_to_datetime_title

    timestamp is Unix timestamp (in seconds since 1970-01-01 00:00:00 UTC)
    datetime for display is "yyyy-MM-dd HH:mm:ss(.SSS)"
    datetime for title is "yyMMddHHmmss"
*/

func get_current_timestamp() -> Double {
    return Date().timeIntervalSince1970
}

func get_current_datetime_display(ms: Bool = false) -> String {
    let date = Date()
    let formatter = DateFormatter()
    if ms {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    } else {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    return formatter.string(from: date)
}

func convert_datetime_display_to_timestamp(datetime: String, ms: Bool = false) -> Double {
    let formatter = DateFormatter()
    if ms {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    } else {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    let date = formatter.date(from: datetime)
    return date!.timeIntervalSince1970
}

func convert_timestamp_to_datetime_display(timestamp: Double, ms: Bool = false) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let formatter = DateFormatter()
    if ms {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    } else {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    return formatter.string(from: date)
}

func get_current_datetime_title() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyMMddHHmmss"
    return formatter.string(from: date)
}

func convert_datetime_title_to_timestamp(title: String) -> Double {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyMMddHHmmss"
    let date = formatter.date(from: title)
    return date!.timeIntervalSince1970
}

func convert_timestamp_to_datetime_title(timestamp: Double) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let formatter = DateFormatter()
    formatter.dateFormat = "yyMMddHHmmss"
    return formatter.string(from: date)
}