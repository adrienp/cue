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

require ["audio", "audiocue"], (Audio, AudioCue) ->
    # App Logic

    # a = new Audio(["sounds/alegria.mp3"])

    # a.play()

    # console.log SM

    # SM.onready ->
    #     console.log "Ready..."

    #     s = SM.createSound
    #         id: 'sunday'
    #         url: 'sounds/sunday.mp3'

    #     s.play()

    #     console.log "Sound!", s

    Audio.onReady ->
        window.A = Audio
        window.AC = AudioCue

        window.a = new Audio("sunday", "/sounds/sunday.mp3")
        window.ac = new AudioCue(3, "thing")

        ac.setAudio(a)

        ac.loopStart = 4000
        ac.loopEnd = 6000
        ac.numLoops = 0