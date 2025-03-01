(local tonka {})

(fn tonka.hello [opts]
  (if opts.name
            (print "hello," opts.name)
            (print "hello")))

(fn tonka.setup [opts]
  (let [opts (or opts {})]
    (vim.keymap.set "n" "<Leader>h"
      (fn [] (tonka.hello opts)))))

tonka
