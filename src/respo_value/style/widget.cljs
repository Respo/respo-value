
(ns respo-value.style.widget (:require [hsl.core :refer [hsl]]))

(def literal
  {:line-height "16px",
   :border-radius "4px",
   :padding "0px 4px",
   :color (hsl 0 0 30),
   :font-family "Source Code Pro, menlo, monospace",
   :font-size "12px",
   :display "inline-block",
   :margin "4px",
   :box-shadow (str "0 0 1px " (hsl 0 0 0 0.3)),
   :vertical-align "top"})

(def only-text {:pointer-events "none"})

(def structure
  {:line-height "16px",
   :border-radius "4px",
   :padding "0px 2px",
   :color (hsl 0 0 40),
   :font-family "Source Code Pro, menlo, monospace",
   :font-size "12px",
   :display "inline-block",
   :margin "4px",
   :box-shadow (str "0 0 1px " (hsl 0 0 0 0.3)),
   :vertical-align "top",
   :cursor "pointer"})

(def style-children {:display "inline-block", :vertical-align "top", :padding "0px"})

(def style-hint {:width "240px", :color (hsl 0 0 50), :font-size "14px"})

(def style-unknown {})
