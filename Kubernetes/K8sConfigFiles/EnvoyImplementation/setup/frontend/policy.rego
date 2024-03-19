# policy.rego
package envoy.authz

import rego.v1

import input.attributes.request.http

default allow := false

allow if {
    is_request_valid
}

is_request_valid if {
    http.method == "GET"
    glob.match("/",["/"],http.path)
}


is_request_valid if {
    http.method == "GET"
    glob.match("/#/login",["/"],http.path)
}
is_request_valid if {
    http.method == "POST"
    glob.match("/#/login",["/"],http.path)
}


is_request_valid if {
    http.method == "GET"
    glob.match("/login",["/"],http.path)
}
is_request_valid if {
    http.method == "POST"
    glob.match("/login",["/"],http.path)
}


is_request_valid if {
    http.method == "GET"
    glob.match("/app.js",["/"],http.path)
}


is_request_valid if {
    http.method == "GET"
    glob.match("/static/img/unibg.5736827.png",["/"],http.path)
}


is_request_valid if {
    glob.match("/__webpack_hmr",["/"],http.path)
}


is_request_valid if {
    http.method == "POST"
    glob.match("/zipkin",["/"],http.path)
}


is_request_valid if {
     http.method == "GET"
    glob.match("/todos",["/"],http.path)
    token.valid
}
is_request_valid if {
     http.method == "POST"
    glob.match("/todos",["/"],http.path)
    token.valid
}


is_request_valid if {
    http.method == "DELETE"
    glob.match("/todos/*",["/"],http.path)
    token.valid
}


token := {"valid": valid, "payload": payload} if {
    [_, encoded] := split(http.headers.authorization, " ")
    [valid, _, payload] := io.jwt.decode_verify(encoded, {"secret":"myfancysecret"})
}