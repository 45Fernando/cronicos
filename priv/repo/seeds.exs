# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cronicos.Repo.insert!(%Cronicos.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Cronicos.Repo
alias Cronicos.Users.User

Repo.delete_all(User)

users_data = [
  %User{
    email: "admin@example.org.ar",
    password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("123456789"),
    role: "admin"
  },
  %User{
    email: "auditor@example.org.ar",
    password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("123456789"),
    role: "auditor"
  },
  %User{
    email: "expendor@example.org.ar",
    password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("123456789"),
    role: "expendedor"
  },
  %User{
    email: "user@example.org.ar",
    password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("123456789"),
    role: "user"
  }
]

Enum.each(users_data, fn(data) ->
  Repo.insert!(data)
end)
