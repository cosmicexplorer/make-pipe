spawn = require('child_process').spawn

splitArrayByIndex = (index, arr) ->
  [arr[..(index - 1)], arr[(index + 1)..]]

splitArrayByElement = (el, arr) ->
  ind = arr.indexOf el
  switch ind
    when -1 then [arr]
    else
      split = splitArrayByIndex ind, arr
      [split[0]].concat splitArrayByElement el, split[1]

chainProcessStdio = (argvs) ->
  curArgv = argvs[0]
  curProc = spawn curArgv[0], curArgv[1..]
  curProc.stdout.pipe switch argvs.length
    when 1 then process.stdout
    else chainProcessStdio argvs[1..]
  curProc.stderr.pipe process.stderr
  curProc.on 'exit', (code) -> process.exit code if code
  curProc.stdin

commandPipeline = chainProcessStdio splitArrayByElement '|', process.argv[2..]

process.stdin.pipe commandPipeline if process.env.LISTEN
