(local tonka {})

(fn tonka.setup [opts]
  (let [opts (or opts {})]
    (print opts)
    (vim.keymap.set "n" "<Leader>h"
      (fn []
        (if opts.name
          (print "hello," opts.name)
          (print "hello"))))))

tonka
