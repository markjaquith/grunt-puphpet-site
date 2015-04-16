###
# ================================================
# grunt-puphpet-site
#
# Copyright (c) 2015 Mark Jaquith
#
# Licensed under the MIT License
# ================================================
###

# Basic template description
exports.description = 'Create a PuPHPet site.'

# Template-specific notes to be displayed before question prompts.
exports.notes = ''

# Template-specific notes to be displayed after the question prompts.
exports.after = ''

# Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = '*'

# The init template
exports.template = (grunt, init, done) ->
  getRandomInt = (min, max) -> Math.floor( Math.random() * ( max - min ) ) + min

  ip = '192.168.' + getRandomInt( 2, 255 ) + '.' + getRandomInt( 2, 255 )

  init.process {}, [
    init.prompt 'domain', 'example.com'
    init.prompt 'shortname', 'example'
    init.prompt 'ip', ip
  ], (err, props) ->
    # Files to copy and process
    files = init.filesToCopy props

    # Actually copy and process files
    init.copyAndProcess files, props

    # Done!
    done()
