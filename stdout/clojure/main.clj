(require '[clojure.java.io :as io])

(with-open [rdr (clojure.java.io/reader "countries.txt")]
  (doseq [line (line-seq rdr)]
    (println "Fuck" line))) 

