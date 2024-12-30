import Foundation

struct MovingAverage {
    private var values: [Double] = []
    private var size: Int
    private var count: Int = 0
    private var index: Int = 0
    private var sum: Double = 0.0
    
    init(size: Int = 10) {
        self.size = max(1, size)
        self.values = Array(repeating: 0.0, count: self.size)
    }
    
    mutating func add(_ value: Double) {
        self.sum += value
        self.sum -= self.values[self.index]
        self.values[self.index] = value
        self.index = (self.index + 1) % self.size
        self.count = min(self.size, self.count+1)
    }
    
    mutating func reset() {
        self.count = 0
        self.index = 0
        self.sum = 0.0
        self.values = Array(repeating: 0.0, count: self.size)
    }
    
    func average() -> Double {
        if self.count == 0 { return Double.nan }
        else { return self.sum / Double(self.count) }
    }
}