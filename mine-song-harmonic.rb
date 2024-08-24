use_bpm 60

define :melody do
  use_synth :piano
  play_pattern_timed [:c4, :e4, :g4, :b4, :c5, :b4, :g4, :e4], [0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 1]
  play_pattern_timed [:d4, :f4, :a4, :c5, :d5, :c5, :a4, :f4], [0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 1]
  play_pattern_timed [:e4, :g4, :b4, :d5, :e5, :d5, :b4, :g4], [0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 1]
  play_pattern_timed [:f4, :a4, :c5, :e5, :f5, :e5, :c5, :a4], [0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 1]
end

define :harmony do
  use_synth :piano
  play_pattern_timed [:c3, :e3, :g3], [1, 1, 1]
  play_pattern_timed [:d3, :f3, :a3], [1, 1, 1]
  play_pattern_timed [:e3, :g3, :b3], [1, 1, 1]
  play_pattern_timed [:f3, :a3, :c4], [1, 1, 1]
end

define :bassline do
  use_synth :fm
  play_pattern_timed [:c2, :g2, :c3], [1, 0.5, 0.5]
  play_pattern_timed [:d2, :a2, :d3], [1, 0.5, 0.5]
  play_pattern_timed [:e2, :b2, :e3], [1, 0.5, 0.5]
  play_pattern_timed [:f2, :c3, :f3], [1, 0.5, 0.5]
end

define :counter_melody do
  use_synth :pluck
  play_pattern_timed [:g4, :f4, :e4, :d4], [0.5, 0.5, 0.5, 0.5]
  play_pattern_timed [:a4, :g4, :f4, :e4], [0.5, 0.5, 0.5, 0.5]
  play_pattern_timed [:b4, :a4, :g4, :f4], [0.5, 0.5, 0.5, 0.5]
  play_pattern_timed [:c5, :b4, :a4, :g4], [0.5, 0.5, 0.5, 0.5]
end

live_loop :main_loop do
  in_thread do
    melody
  end
  
  in_thread do
    harmony
  end
  
  in_thread do
    bassline
  end
  
  in_thread do
    counter_melody
  end
  
  sleep 16
end
