(local tonka {})

(fn tonka.echo [str]
  (let [job (require "plenary.job")
	myjob (job:new {"command" "echo"
		        "args" [str]
			"cwd" "/"
			"on_exit" (fn [j return_val]
				    (let [lines (j:result)]
				      (. lines 1)))})]
    (. (myjob:sync) 1)))

(fn tonka.hello [opts]
  (if opts.name
            (print "hello," opts.name)
            (print "hello")))

(fn tonka.setup [opts]
  (let [opts (or opts {})]
    (vim.keymap.set "n" "<Leader>h" (fn [] (print (tonka.echo "Hello from Tonka!"))))))

tonka
