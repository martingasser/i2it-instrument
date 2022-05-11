use_synth :piano

s = nil

live_loop :note_on do
  note, velocity = sync "/midi:iac_driver_bus_1:1/note_on"
  s = play 60, release: 5
end

live_loop :note_off do
  note, velocity = sync "/midi:iac_driver_bus_1:1/note_off"
  if s != nil
    control s, sustain: 0, release: 0
  end
end
