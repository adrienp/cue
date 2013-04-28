define ["cue", "audio"], (Cue, Audio) ->

    class AudioCue extends Cue
        constructor: (number = "", name = "") ->
            super number, name
            
            @audio = null

            @start = 0
            @end = 0
            @loopStart = 0
            @loopEnd = 0

