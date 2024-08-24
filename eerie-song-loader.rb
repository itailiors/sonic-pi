use_bpm 60

# Melody and chords
live_loop :my_loop do
  # Notes
  notes = [:fs3, :f3, :r, :ds3, :ds3, :fs3, :f3]
  durations = [0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25] # Adjust as needed
  # Chords
  chords = [chord(:f3, :major), chord(:d3, :minor)]
  chord_durations = [2, 2] # Adjust as needed
  
  # Loop through the notes
  notes.zip(durations).each do |note, duration|
    with_fx :reverb, room: 0.6 do
      play note, amp: 0.6
    end
    sleep duration
  end
  
  # Loop through the chords
  chords.zip(chord_durations).each do |chord, duration|
    with_fx :echo, decay: 1, mix: 0.4 do
      play_chord chord, amp: 0.5
    end
    sleep duration
  end
  
  sleep 2
end

live_loop :bass do
  use_synth :fm
  use_synth_defaults attack: 0.1, release: 2, depth: 1, divisor: 1.5, cutoff: 70
  bass_notes = [:f2, :d2]
  bass_durations = [2,2]
  bass_notes.zip(bass_durations).each do |note, duration|
    play note, amp: 0.6
    sleep duration
  end
end

# Synth pads
live_loop :synth_pad do
  use_synth :prophet
  use_synth_defaults attack: 2, release: 4, cutoff: 90
  with_fx :slicer, phase: 0.125, wave: 0, invert_wave: 1 do
    play chord(:fs4, :major), amp: 4, attack: 4, release: 8
    sleep 8
    play chord(:ds4, :minor), amp: 4, attack: 4, release: 8
    sleep 8
  end
end

# Hi-hat loop
live_loop :hi_hat_loop do
  16.times do |i|
    if i % 4 == 3
      sample :drum_cymbal_open, amp: 1, attack: 0, sustain: 0.1, release: 0.1
      sleep 0.4
      sample :drum_cymbal_closed, amp: 0.8
      sleep 0.1
    else
      sample :drum_cymbal_open, amp: 0.8, attack: 0, sustain: 0.1, release: 0.1
      sleep 0.3
      sample :drum_cymbal_closed, amp: 0.7
      sleep 0.1
      sample :drum_cymbal_closed, amp: 0.5
      sleep 0.1
    end
  end
end

# Percussion loop
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





