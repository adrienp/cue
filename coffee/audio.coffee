define ["soundmanager"], (SM) ->

    class Audio
        constructor: (id, url) ->
            @sound = SM.createSound
                id: id
                url: url
                autoLoad: true
                whileplaying: @_playingHandler

        play: ->
            @sound.play()

        pause: ->
            @sound.pause()

        stop: ->
            @sound.stop()

        onLoad: (fn) ->
            if @sound.loaded
                fn()
            else
                @sound.load
                    onload: fn

        onPosition: (pos, fn) ->
            @sound.onPosition pos, fn

        clearOnPosition: (pos, fn) ->
            @sound.clearOnPosition pos, fn

        setPosition: (pos) ->
            @sound.setPosition pos

        getDuration: ->
            if @sound.loaded
                @sound.duration
            else
                @sound.durationEstimate

        _playingHandler: (e) =>
            console.log e


        @onReady = (fn) ->
            SM.onready fn

