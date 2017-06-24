class custom_users {
  $user_accounts = hiera('custom_users')
  create_resources(user, $user_accounts)
}