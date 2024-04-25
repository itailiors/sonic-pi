# Welcome to Sonic Pi
use_bpm 120

define :laugh do
  sample :ambi_choir, rate: 0.5, attack: 0.2, release: 0.5
  sleep 1
end

define :boing do
  sample :ambi_glass_hum, rate: 2, attack: 0.1, release: 0.3
  sleep 0.5
end

define :crash do
  sample :drum_cymbal_hard, amp: 2
  sleep 0.5
end

define :drum_loop do
  sample :drum_bass_hard, amp: 2
  sleep 0.5
  sample :drum_snare_hard, amp: 2
  sleep 0.5
end

live_loop :funny_movie do
  play_pattern_timed [:C4, :E4, :G4, :C5], [0.5, 0.5, 0.5, 1]
  laugh
  boing
  crash
  play_pattern_timed [:F4, :A4, :C5, :F5], [0.5, 0.5, 0.5, 1]
  laugh
  boing
  crash
  
  if tick % 16 == 0
    use_synth :saw
    play_chord chord(:C4, :major)
    sleep 2
    play_chord chord(:E4, :major)
    sleep 2
    play_chord chord(:G4, :major)
    sleep 2
    play_chord chord(:B4, :major)
    sleep 2
  end
  

  drum_loop if (ring true, false).tick
end

live_loop :hi_hat do
  sleep 16
  loop do
    16.times do |i|
      if i % 4 == 3
        3.times do
          sample :drum_cymbal_closed, amp: 0.8
          sleep 0.25 / 3.0
        end
      else
        sample :drum_cymbal_closed, amp: 0.8
        sleep 0.25
      end
    end
  end
end





