use_synth :prophet

s = nil
val = 80

live_loop :SYN do
  s = play 48, sustain: 0.1, release: 0.1, attack: 0.01, decay: 0.01, cutoff: val
  sleep 0.125
end

live_loop :cc do
  sleep 0.01
  ccno, val = sync "/midi:js2sonicpi_2:1/control_change"
end