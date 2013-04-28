require.config
    paths:
        jquery: "lib/jquery-2.0.0"
        Howler: "lib/howler"
        soundmanager: "lib/soundmanager/script/soundmanager2"

    shim:
        soundmanager:
            exports: "soundManager"
            init: (SM) ->
                soundManager.setup
                    url: "js/lib/soundmanager/swf"
                    flashVersion: 9

require ["audio", "soundmanager"], (Audio, SM) ->
    # App Logic

    # a = new Audio(["sounds/alegria.mp3"])

    # a.play()

    console.log SM

    SM.onready ->
        console.log "Ready..."

        s = SM.createSound
            id: 'sunday'
            url: 'sounds/sunday.mp3'

        s.play()

        console.log "Sound!", s