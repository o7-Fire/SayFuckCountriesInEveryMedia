(require '[clojure.core.async    :as a])
(require '[discljord.connections :as c])
(require '[discljord.messaging   :as m])

(def token      "TOKEN")
(def intents    #{:guilds :guild-messages})
(def channel-id "12345")

(let [event-ch      (a/chan 100)
      connection-ch (c/connect-bot! token event-ch :intents intents)
      message-ch    (m/start-connection! token)]
  (try
    (loop []
      (let [[event-type event-data] (a/<!! event-ch)]
        (when (and (= :message-create event-type)
                   (= (:channel-id event-data) channel-id)
                   (not (:bot (:author event-data))))
          (let [message-content (:content event-data)]
            (if (= "Fuck" (s/trim (s/lower-case message-content)))
              (do
                (use 'clojure.java.io)
                (with-open [rdr (reader "countries.txt")]
                (doseq [line (line-seq rdr)]
                (m/create-message! message-ch channel-id ::content "Fuck" line)))
                (c/disconnect-bot! connection-ch))
              (m/create-message! message-ch channel-id :content message-content))))
        (when (= :channel-pins-update event-type)
          (c/disconnect-bot! connection-ch))
        (when-not (= :disconnect event-type)
          (recur))))
    (finally
      (m/stop-connection! message-ch)
      (a/close!           event-ch))))
