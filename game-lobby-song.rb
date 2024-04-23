# Welcome to Sonic Pi

live_loop :funk_drums do
  sample :drum_bass_hard, rate: 0.5, amp: 1.5
  sleep 0.40
  
  sample :drum_snare_hard, amp: 1.5
  sleep 0.35
  sample :drum_snare_hard, amp: 1.5
  sleep 0.5
  
  sample :drum_bass_hard, rate: 0.5, amp: 1.5
  sleep 0.25
  sample :drum_snare_hard, amp: 1.5
  sleep 0.5
end

live_loop :hi_hat_loop do
  16.times do |i|
    if i % 4 == 3
      sample :drum_cymbal_open, amp: 1.5, attack: 0, sustain: 0.1, release: 0.1
      sleep 0.4
      sample :drum_cymbal_closed, amp: 1.5
      sleep 0.1
    else
      sample :drum_cymbal_open, amp: 1.5, attack: 0, sustain: 0.1, release: 0.1
      sleep 0.3
      sample :drum_cymbal_closed, amp: 1.5
      sleep 0.1
      sample :drum_cymbal_closed, amp: 1.5
      sleep 0.1
    end
  end
end




live_loop :perco do
  loop do
    16.times do |i|
      if i % 8 == 7
        3.times do
          sample :perc_snap, amp: 0.8
          sleep 0.25 / 3.0
        end
      else
        sample :perc_snap2, amp: 0.8
        sleep 0.25
      end
    end
  end
end



use_synth :tb303

live_loop :bouncy_bass do
  play :e1, release: 0.1, cutoff: 80, res: 0.9, amp: 0.8
  sleep 0.5
  play :g1, release: 0.1, cutoff: 80, res: 0.9, amp: 0.8
  sleep 0.5
  play :a1, release: 0.1, cutoff: 80, res: 0.9, amp: 0.8
  sleep 0.5
  play :e2, release: 0.1, cutoff: 80, res: 0.9, amp: 0.8
  sleep 0.5
end

use_synth :fm

# Define the chord progression based on the circle of fifths
chord_progression = [chord(:C4, :major7),
                     chord(:F4, :major7),
                     chord(:Bb4, :major7),
                     chord(:Eb4, :major7)]

# Play the walking bass line
live_loop :jazz_walking_bass do
  # Define the walking bass notes
  walking_bass_progression = []
  
  # Generate walking bass notes for each chord
  chord_progression.each do |chord|
    root_note = chord[0]
    walking_bass_progression << [root_note - 12, root_note - 8, root_note - 5, root_note - 3]
  end
  
  # Randomize the walking bass notes
  walking_bass_progression.shuffle!
  
  # Play the bass notes for each chord
  chord_progression.zip(walking_bass_progression).each do |chord, bass_notes|
    # Play each bass note of the chord
    bass_notes.each do |note|
      play note, release: 0.5, amp: 0.7
      sleep 0.5
    end
  end
end


chord_progression = [
  chord(:C4, :major),
  chord(:F4, :major),
  chord(:D4, :minor),
  chord(:G4, :major)
]


live_loop :play_chords do
  index = tick % chord_progression.length
  current_chord = chord_progression[index]
  
  play_chord current_chord
  
  # Randomly choose a rhythmic pattern
  case [true, false].choose
  when true
    sleep 4
  when false
    sleep 4
  end
end

use_synth :chiplead

melody_progression = [
  [:e3, 0.5], [:g3, 0.5], [:b3, 0.5], [:d4, 0.5],
  [:c4, 0.25], [:d4, 0.25], [:e4, 0.25], [:f4, 0.25],
  [:g4, 0.5], [:b3, 0.5], [:d4, 0.5], [:f4, 0.5],
  [:e4, 0.25], [:d4, 0.25], [:c4, 0.25], [:b3, 0.25]
]


define :play_melody do |notes|
  notes.each do |note, duration|
    play note, release: 0.3, amp: 1.2
    sleep duration
  end
end


live_loop :melody do
  play_melody melody_progression
end

# Define ambient sounds
ambient_sounds = [:ambi_lunar_land, :ambi_drone, :ambi_dark_woosh]

# Play ambient sounds in a separate loop
live_loop :ambience do
  sample ambient_sounds.choose, rate: [0.9, 1, 1.1].choose, amp: 0.3, pan: [-1, 0, 1].choose
  sleep [4, 8, 16].choose
end


