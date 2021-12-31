;; Twitter API v1

(ns mynamespace
  (:use [twitter.oauth]
        [twitter.callbacks]
        [twitter.callbacks.handlers]
        [twitter.api.restful]
        [clojure.java.io])
  (:import [twitter.callbacks.protocols SyncSingleCallback]))

(def my-creds (make-oauth-creds *consumerkey*
                                *consumersecret*
                                *accesstoken*
                                *accesstokensecret*))

(statuses-update :oauth-creds my-creds
                (with-open [rdr (reader "countries.txt")]
                (doseq [line (line-seq rdr)]
                 :params {:status "Fuck" line})
