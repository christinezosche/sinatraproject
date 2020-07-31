han_solo = User.create(name: "Han Solo", username: "Han_Solo", password: "Han_Solo")
Flight.create(date: "2020-08-15", destination: "Alderaan", ship: "Millennium Falcon", items: "Jedi training manuals", user_id: han_solo.id)
Flight.create(date: "2020-08-18", destination: "Hoth", ship: "Millennium Falcon", items: "Fur coats and lightsabers", user_id: han_solo.id)
Flight.create(date: "2020-08-20", destination: "Tatooine", ship: "Millennium Falcon", items: "Droids and scavenged parts", user_id: han_solo.id)
luke_skywalker = User.create(name: "Luke Skywalker", username: "Luke_Skywalker", password: "Luke_Skywalker")
Flight.create(date: "2020-08-17", destination: "Yavin 4", ship: "X-Wing", items: "Moon rocks and binoculars", user_id: luke_skywalker.id)
Flight.create(date: "2020-08-16", destination: "Tatooine", ship: "Lambda Shuttle", items: "Family heirlooms", user_id: luke_skywalker.id)
Flight.create(date: "2020-08-19", destination: "Alderaan", ship: "Starfreighter", items: "Yoda's last will and testament", user_id: luke_skywalker.id)

