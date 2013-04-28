define ["cue", "audio", "debug"], (Cue, Audio, debug) ->

    class AudioCue extends Cue
        constructor: (number = "", name = "") ->
            super number, name
            
            @audio = null

            @start = 0
            @end = 0
            @loopStart = 0
            @loopEnd = 0

            @numLoops = 0

            debug.log "New AudioCue:", number, name

        setAudio: (audio) ->
            @audio = audio

            @audio.onLoad @_loadHandler


        go: ->
            debug.log "Go!", @number, @name

            @loop = 0
            @_curLoopEnd = @loopEnd
            @_curEnd = @end

            @audio.onPosition @_curLoopEnd, @_loopEndHandler
            @audio.onPosition @_curEnd, @_endHandler

            @audio.setPosition @start

            @audio.play()

        stop: ->
            @audio.stop()
            @audio.clearOnPosition @_curEndLoop
            @audio.clearOnPosition @_curEnd

        _loadHandler: =>
            @start = 0
            @end = @audio.getDuration()

            # @loopStart = 0
            # @loopEnd = @end

        _endHandler: (pos) =>
            @stop()

        _loopEndHandler: (pos) =>
            debug.log "End loop:", pos

            if @loop < @numLoops
                @loop += 1
                @audio.setPosition @loopStart
