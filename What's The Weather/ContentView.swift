import SwiftUI

struct ContentView: View {
    @State private var weatherData: WeatherData?
    @State private var city: String = "London"
    
    var body: some View {
        ZStack {
            // Add the background color for the entire app
            Color(("EDE8DC")) // You can change this to any color you like
                .edgesIgnoringSafeArea(.all) // This ensures the background color fills the entire screen
            
            VStack {
                
                TextField("Enter city", text: $city)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(action: {
                    WeatherManager().fetchWeather(city: city) { weather in
                        self.weatherData = weather
                    }
                }) {
                    Text("Get Weather")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)
                
                if let weatherData = weatherData {
                    VStack {
                        Text(weatherData.name)
                            .font(.largeTitle)
                            .padding(.top)
                        Text("\(weatherData.main.temp, specifier: "%.1f")°C")
                            .font(.system(size: 70))
                            .bold()
                            .padding()
                        Text(weatherData.weather.first?.description.capitalized ?? "")
                            .font(.title)
                    }
                } else {
                    Text("No data")
                        .font(.title)
                        .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
