use_synth :prophet

s = nil

live_loop :on do
  pitch, velocity = sync "/midi:js2sonicpi_2:1/note_on"
  s = play 46,
    sustain: 10.1
end

live_loop :off do
  note, vel = sync "/midi:js2sonicpi_2:1/note_off"
  puts note
  if s != nil
    control s, amp: 0, amp_slide: 1.3
    sleep 0
    kill s
  end
end