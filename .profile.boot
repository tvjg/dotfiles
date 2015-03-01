(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[cider/cider-nrepl "0.9.0-SNAPSHOT"]
                [com.cemerick/piggieback "0.1.5"]
                [weasel "0.6.1-jtg-SNAPSHOT"]])

(swap! boot.repl/*default-middleware*
       concat '[[cider.nrepl/cider-middleware]
                [cemerick.piggieback/wrap-cljs-repl]])
