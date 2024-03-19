# policy.rego
package envoy.authz

import rego.v1

import input.attributes.request.http as http_request

default allow := true