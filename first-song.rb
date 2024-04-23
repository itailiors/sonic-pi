# Welcome to Sonic Pi


use_synth :prophet
with_fx :reverb, room: 0.8, mix: 0.5 do
  notes = (scale :c4, :minor_pentatonic, num_octaves: 2)
  
  live_loop :melody do
    4.times do
      play notes.choose, release: 0.5
      sleep 0.25
    end
  end
end

live_loop :drum_and_bass do
  sample :drum_bass_hard, rate: 0.5, amp: 1.5
  sleep 0.5
  sample :drum_bass_hard, rate: 0.5, amp: 1.5
  sleep 0.5
  sample :drum_snare_hard, amp: 1.5
  sleep 1
  sample :drum_bass_hard, rate: 0.5, amp: 1.5
  sleep 1
  sample :drum_snare_hard, amp: 1.5
  sleep 1
end

live_loop :bassline do
  use_synth :fm
  use_octave 0
  play :c2, release: 1, amp: 1.2
  sleep 1
  play :g2, release: 1, amp: 1.5
  sleep 1
  play :f2, release: 1, amp: 1.3
  sleep 1
  play :d2, release: 1, amp: 1.4
  sleep 1
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

live_loop :background do
  with_fx :flanger, phase: 0.7, depth: 1, decay: 2 do
    with_synth :growl do
      play_chord chord(:c4, :minor), release: 4, attack: 4, amp: 0.5
      sleep 8
    end
  end
end

live_loop :vocal_melody do
  use_synth :blade
  use_transpose 12
  notes = (scale :c4, :minor_pentatonic, num_octaves: 2)
  with_fx :echo, mix: 0.4, phase: 0.25, decay: 4 do
    8.times do
      play_pattern_timed notes.shuffle.take(4), 0.125, release: 0.3, cutoff: rrand(80, 120)
    end
  end
end



