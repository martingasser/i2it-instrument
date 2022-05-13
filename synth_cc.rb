use_synth :prophet

s = nil

ccdict = { 40 => 64,
           41 => 48 }
val = 80
pitch = 48
release = 0.5

live_loop :SYN do
  s = play ccdict[41],
    sustain: 0.1,
    release: 0.1,
    attack: 0.01,
    decay: 0.01,
    cutoff: ccdict[40]
  sleep 0.125
end


live_loop :cc do
  sleep 0.01
  ccno, val = sync "/midi:js2sonicpi_0:1/control_change"
  ccdict[ccno] = val
end