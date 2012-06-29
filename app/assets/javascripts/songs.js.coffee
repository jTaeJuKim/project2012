# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# You cannot write plain javascript in this file without creating an error.
# the code below could be used as a starting point for transposition
transposeChord = (chord, amount) ->
  scale = [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ]
  chord.replace /[CDEFGAB]#?/g, (match) ->
    i = (scale.indexOf(match) + amount) % scale.length
    scale[(if i < 0 then i + scale.length else i)]