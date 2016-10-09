# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

boards = Board.create([{ name: "easy" }, 
                       { name: "normal" }, 
                       { name: "hard" }])

characters = Character.create([
                      { name: "Waldo", posx: 485, posy: 331, board_id: 1 },
                      { name: "Odlaw", posx: 221, posy: 335, board_id: 1 },
                      { name: "Wizard", posx: 583, posy: 335, board_id: 1 },
                      { name: "Waldo", posx: 454, posy: 243, board_id: 2 },
                      { name: "Wizard", posx: 0, posy: 225, board_id: 2 },
                      { name: "Wenda", posx: 664, posy: 272, board_id: 2 },
                      { name: "Waldo", posx: 678, posy: 228, board_id: 3 },
                      { name: "Wizard", posx: 317, posy: 246, board_id: 3 },
                      { name: "Odlaw", posx: 175, posy: 472, board_id: 3 },
                      { name: "Wenda", posx: 272, posy: 462, board_id: 3 } 
                        ])
