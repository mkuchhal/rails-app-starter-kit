# MY NOTE: This is taken from:
# https://github.com/gonzalo-bulnes/simple_token_authentication#configuration.
SimpleTokenAuthentication.configure do |config|
  # Configure the session persistence policy after a successful sign in, i.e.,
  # if the authentication token acts as a sign-in token.
  # If true, user is stored in the session, and the authentication token and
  # email may be provided only once.
  # If false, users need to provide their authentication token and email with
  # every request.
  # config.sign_in_token = false

  # Configure the name of the HTTP headers watched for authentication.
  #
  # Default header names for a given token authenticatable entity follow this
  # pattern:
  #   { entity: { authentication_token: 'X-Entity-Token', email: 'X-Entity-Email' } }
  #
  # When several token authenticatable models are defined, custom header names
  # can be specified for none, any, or all of them.
  #
  # Examples
  #   Given User and SuperAdmin are token authenticatable,
  #   When the following configuration is used...
  #     `config.header_names = { super_admin: { authentication_token: 'X-Admin-Auth-Token' } }`
  #   ...the token authentication handler for User watches these headers...
  #     `X-User-Token, X-User-Email`
  #   ...and the token authentication handler for SuperAdmin watches these:
  #     `X-Admin-Auth-Token, X-SuperAdmin-Email`
  #
  # config.header_names = { user: { authentication_token: 'X-User-Token', email: 'X-User-Email' } }
end
