
ns respo-value.core $ :require
  [] hsl.core :refer $ [] hsl
  [] respo.renderer.expander :refer $ [] render-app
  [] respo.controller.deliver :refer $ [] build-deliver-event mutate-factory
  [] respo.renderer.differ :refer $ [] find-element-diffs
  [] respo.util.format :refer $ [] purify-element
  [] respo-client.controller.client :refer $ [] initialize-instance activate-instance patch-instance
  [] respo-value.component.container :refer $ [] container-component
  [] devtools.core :as devtools

defonce global-store $ atom nil

defonce global-states $ atom ({})

defonce global-element $ atom nil

defn render-element ()
  let
    (build-mutate $ mutate-factory global-element global-states)
    render-app (container-component @global-store)
      , @global-states build-mutate

defn dispatch (op op-data)
  .log js/console |dispatch: op op-data

defn get-root ()
  .querySelector js/document |#app

defn mount-app ()
  let
    (element $ render-element)
      deliver-event $ build-deliver-event global-element dispatch
    initialize-instance (get-root)
      , deliver-event
    activate-instance (purify-element element)
      get-root
      , deliver-event
    reset! global-element element

defn rerender-app ()
  let
    (element $ render-element)
      changes $ find-element-diffs ([])
        []
        purify-element @global-element
        purify-element element
      deliver-event $ build-deliver-event global-element dispatch

    .info js.console |Changes: changes
    patch-instance changes (get-root)
      , deliver-event
    reset! global-element element

defn -main ()
  devtools/enable-feature! :sanity-hints :dirac
  devtools/install!
  println |Loaded
  mount-app
  add-watch global-store :rerender rerender-app
  add-watch global-states :rerender rerender-app

defn on-jsload ()
  println |Reload
  rerender-app

set! js/window.onload -main
