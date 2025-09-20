import SwiftUI
import AudioToolbox
import Combine

class SystemSoundPlayer: ObservableObject {
    @Published var currentSoundID: SystemSoundID = 1000
    @Published var isPlaying = false
    @Published var favoriteSounds: [Int] = [] { // Geändert zu Int
        didSet {
            saveFavorites()
        }
    }
    @Published var selectedSoundID: SystemSoundID?

    init() {
        loadFavorites()
    }

    func startPlaying() {
        guard !isPlaying else { return }
        isPlaying = true
        playNextSound()
    }

    func stopPlaying() {
        isPlaying = false
    }

    func addFavoriteSound() {
        guard favoriteSounds.count < 10 else { return }
        let soundID = Int(currentSoundID)
        if !favoriteSounds.contains(soundID) {
            favoriteSounds.append(soundID)
        }
    }

    func toggleFavoriteSound(soundID: Int) {
        if favoriteSounds.contains(soundID) {
            favoriteSounds.removeAll { $0 == soundID }
            if selectedSoundID == SystemSoundID(soundID) {
                selectedSoundID = nil
            }
        } else {
            addFavoriteSound()
        }
    }

    func playFavoriteSound(soundID: Int) {
        AudioServicesPlaySystemSound(SystemSoundID(soundID))
        selectedSoundID = SystemSoundID(soundID)
    }

    private func playNextSound() {
        guard isPlaying else { return }
        AudioServicesPlaySystemSound(currentSoundID)
        currentSoundID += 1

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.playNextSound()
        }
    }

    private func saveFavorites() {
        let defaults = UserDefaults.standard
        defaults.set(favoriteSounds, forKey: "favoriteSounds")
    }

    private func loadFavorites() {
        let defaults = UserDefaults.standard
        if let savedSounds = defaults.array(forKey: "favoriteSounds") as? [Int] {
            favoriteSounds = savedSounds
        }
    }
}

struct SystemSoundView: View {
    @StateObject private var soundPlayer = SystemSoundPlayer()
    @State private var inputSoundID: String = "1000"
    @FocusState private var isInputFieldFocused: Bool
    @State private var warningMessage: String?

    var body: some View {
        ZStack {
            ScrollView {
                Text("Aktuelle Sound-ID: \(soundPlayer.currentSoundID)")
                    .font(.headline)
                    .padding(.top)

                HStack(spacing: 0) {

                    Button("Start Sound") {
                        soundPlayer.startPlaying()
                    }
                    .padding(10)
                    //.frame(width: 120, height: 50)
                    .buttonStyle(.borderedProminent)
                    .tint(soundPlayer.isPlaying ? .gray : .blue)

                    Button("Stop") {
                        soundPlayer.stopPlaying()
                    }
                    .padding(10)
                    //.frame(width: 130, height: 50)
                    .buttonStyle(.borderedProminent)
                    .tint(soundPlayer.isPlaying ? .red : .gray)

                    Button("Favorit") {
                        soundPlayer.addFavoriteSound()
                    }
                    .padding(10)
                    //.frame(width: 120, height: 50)
                    .buttonStyle(.bordered)
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(15)


                Spacer()
                    .frame(height: 20)

                VStack(spacing: 10) {
                    Text("Optional:")
                        .font(.headline)
                    HStack(spacing: 15) {
                        Text("Start Sound-ID eingeben:")
                        TextField("", text: $inputSoundID)
                            .keyboardType(.numberPad)
                            .focused($isInputFieldFocused)
                            .frame(maxWidth: 60, maxHeight: 10)
                            .padding()
                            //.background(Color.white)
                            .background(Color(UIColor.systemBackground))

                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(isInputFieldFocused ? Color.blue : Color.gray, lineWidth: 3)
                            )
                            .onSubmit {
                                inputSoundID = inputSoundID.filter { $0.isNumber }
                            }

                        Button("Set") {
                            if let newSoundID = Int(inputSoundID), newSoundID >= 1000, newSoundID <= 2000 {
                                soundPlayer.currentSoundID = SystemSoundID(newSoundID)
                                warningMessage = nil
                            } else {
                                warningMessage = "Sound-ID´s Area 1000 bis 2000"
                                AudioServicesPlaySystemSound(1000)
                            }
                            isInputFieldFocused = false
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)

                }

                Text("Favoriten:")
                    .font(.headline)
                    .padding(.top)

                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(soundPlayer.favoriteSounds, id: \.self) { soundID in
                            HStack {
                                Text("Sound \(soundID)")
                                    .foregroundColor(soundPlayer.selectedSoundID == SystemSoundID(soundID) ? .blue : .primary)
                                    .fontWeight(soundPlayer.selectedSoundID == SystemSoundID(soundID) ? .bold : .regular)
                                    .onTapGesture {
                                        soundPlayer.selectedSoundID = SystemSoundID(soundID)
                                    }
                                Spacer()
                                Image(systemName: "play.circle")
                                    .foregroundColor(.green)
                                    .onTapGesture {
                                        soundPlayer.playFavoriteSound(soundID: soundID)
                                    }

                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .onTapGesture {
                                        soundPlayer.toggleFavoriteSound(soundID: soundID)
                                    }

                            }
                            .padding(15)
                            .background(Color(.systemGray6))
                            .cornerRadius(15)
                        }
                    }
                    .padding(10)

                }

                if let selectedSound = soundPlayer.selectedSoundID {
                    Text("Ausgewählter Sound: \(selectedSound)")
                        .font(.subheadline)
                        .padding(.top)
                }
            }

            if let warning = warningMessage {
                VStack {
                    Text(warning)
                        .foregroundColor(.red)
                        .font(.headline)
                        .padding(15)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.yellow.opacity(0.95))
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                warningMessage = nil
                            }
                        }
                    Spacer()
                        .frame(height: 470)
                }
            }
        }
    }
}

#Preview {
    SystemSoundView()
}
