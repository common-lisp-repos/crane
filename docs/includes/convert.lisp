(defmethod lisp-to-database ((database crane.database:database)
                             (value local-time:timestamp))
  (declare (ignore database))
  (local-time:format-timestring nil value :timezone local-time:+utc-zone+))

(defmethod database-to-lisp ((database crane.database:database)
                             (value integer)
                             (type crane.types:timestamp))
  (declare (ignore database type))
  (local-time:universal-to-timestamp value))

(defmethod database-to-lisp ((database crane.database:database)
                             (value string)
                             (type crane.types:timestamp))
  (declare (ignore database type))
  (local-time:parse-timestring value))