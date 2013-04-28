define ["soundmanager"], (SM) ->

    class Audio
        constructor: (id, url, looping = false, volume = 1) ->
            SM.onready =>
                @sound = SM.createSound
                    id: id
                    url: url
                    volume: volume * 100
                    autoLoad: true

                @sound = new Howl
                    url: urls
                    loop: looping
                    volume: volume
                    autoplay: false
                    onplay: ->
                        console.log "Start"

        play: () ->
            @sound.play()

        pause: () ->
            @sound.pause()

        stop: () ->
            @sound.stop()

