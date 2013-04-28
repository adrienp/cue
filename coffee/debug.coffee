define
    debug: true
    log: ->
        if @debug
            console.log.apply console, arguments