define ["soundmanager"], (SM) ->

    class Audio
        constructor: (id, url) ->
            @sound = SM.createSound
                id: id
                url: url
                autoLoad: true

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

        setPosition: (pos) ->
            @sound.setPosition pos

        getDuration: ->
            if @sound.loaded
                @sound.duration
            else
                @sound.durationEstimate


        @onReady = (fn) ->
            SM.onready fn

